# auto-sync.ps1
# 이 폴더의 변경사항을 자동으로 커밋하고 GitHub에 올립니다.
# 호출되는 곳: 윈도우 예약 작업(10분마다). 직접 실행해도 됩니다.
#
# 주의: 이 파일은 반드시 "UTF-8 with BOM"으로 저장해야 합니다.
#       (Windows PowerShell 5.1이 BOM 없는 UTF-8을 ANSI로 잘못 읽어 한글이 깨집니다)

$ErrorActionPreference = 'Stop'

# 저장소 루트 = 이 스크립트가 있는 .claude 폴더의 부모
$repo = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $repo

# 예약 작업은 PATH가 빈약할 수 있으므로 직접 보강
foreach ($d in @('C:\Program Files\Git\cmd', 'C:\Program Files\GitHub CLI')) {
  if ((Test-Path $d) -and ($env:PATH -notlike "*$d*")) { $env:PATH = "$env:PATH;$d" }
}

$log = Join-Path $PSScriptRoot 'auto-sync.log'
function Log($m) {
  $line = '{0}  {1}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $m
  Add-Content -LiteralPath $log -Value $line -Encoding utf8
}

# 훅과 예약 작업이 겹칠 때를 대비한 잠금
$lock = Join-Path $env:TEMP ('claude-autosync-' + [Math]::Abs($repo.GetHashCode()) + '.lock')
if (Test-Path $lock) {
  $age = (Get-Date) - (Get-Item $lock).LastWriteTime
  if ($age.TotalMinutes -lt 10) { exit 0 }
  Remove-Item $lock -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType File -Path $lock -Force | Out-Null

try {
  if (-not (Test-Path (Join-Path $repo '.git'))) { Log 'git 저장소가 아님 - 건너뜀'; exit 0 }

  git config core.quotepath false

  # 바뀐 게 없으면 조용히 종료
  $changes = @(git status --porcelain)
  if ($changes.Count -eq 0) { exit 0 }

  git add -A
  $staged = @(git diff --cached --name-only)
  if ($staged.Count -eq 0) { exit 0 }

  # 커밋 메시지: 무엇이 바뀌었는지 사람이 읽을 수 있게
  $nl    = [Environment]::NewLine
  $stamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
  $head  = '자동 저장 {0} - 파일 {1}개' -f $stamp, $staged.Count
  $lines = @($staged | Select-Object -First 20 | ForEach-Object { '- ' + $_ })
  if ($staged.Count -gt 20) { $lines += ('- ... 외 {0}개' -f ($staged.Count - 20)) }
  $msg = $head + $nl + $nl + ($lines -join $nl) + $nl

  # PowerShell 5.1은 한글 인자를 exe로 넘길 때 깨질 수 있어 파일로 전달
  $msgFile = Join-Path $env:TEMP 'claude-autosync-msg.txt'
  [System.IO.File]::WriteAllText($msgFile, $msg, (New-Object System.Text.UTF8Encoding($false)))
  git -c i18n.commitEncoding=UTF-8 commit -F $msgFile --quiet
  if ($LASTEXITCODE -ne 0) { throw "commit 실패 (exit $LASTEXITCODE)" }
  Remove-Item $msgFile -Force -ErrorAction SilentlyContinue

  # 원격이 없으면 커밋까지만
  $remote = @(git remote)
  if ($remote.Count -eq 0) { Log "커밋 완료 (원격 없음): $head"; exit 0 }

  # 다른 곳에서 올라간 변경이 있으면 먼저 받아 합치기 (실패해도 push는 시도)
  git pull --rebase --autostash --quiet

  git push --quiet
  if ($LASTEXITCODE -ne 0) { throw "push 실패 (exit $LASTEXITCODE)" }

  Log "GitHub 반영 완료: $head"
}
catch {
  Log "실패: $($_.Exception.Message)"
  exit 1
}
finally {
  Remove-Item $lock -Force -ErrorAction SilentlyContinue
}
