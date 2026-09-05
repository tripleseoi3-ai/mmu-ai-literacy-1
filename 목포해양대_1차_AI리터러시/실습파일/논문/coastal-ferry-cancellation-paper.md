> ## ⚠️ 교육 실습용 가상 논문입니다
>
> 이 문서는 목포해양대학교 AI 리터러시 과정의 **번역·요약 실습을 위해 지어낸 가상 논문**입니다.
> 실제 연구 결과가 아니므로 **어디에도 인용하지 마세요.**
> 저자, 소속 기관, 학술지, 참고문헌, 표에 실린 모든 수치는 전부 창작한 것이며
> 실존하는 논문·연구자·기관과는 아무 관련이 없습니다.
> 본문에 나오는 항로명과 지명(Hanbyeol Archipelago 등)도 실재하지 않는 가상의 지명입니다.
>
> 사용처: **실습 03**(직접 쓴 프롬프트로 번역·요약), **실습 04**(인터뷰 기법으로 다시 만들고 HTML로 정리)

---

# Determinants of Service Cancellation on Coastal Passenger Ferry Routes: Evidence from the Hanbyeol Archipelago Network, 2019–2024

**Ha-eun Seo¹, Minjun Kwak¹, Dae-ho Yoon²**

¹ Institute for Coastal Transport Studies, Hanbyeol Polytechnic
² Division of Maritime Operations, Seorim Institute of Ocean Policy

*Journal of Coastal Transport Systems*, Vol. 18, No. 2, pp. 133–151 (2025)

---

## Abstract

Coastal passenger ferries are the only scheduled public transport available to residents of small island communities, yet their reliability remains poorly documented. This study examines the determinants of service cancellation across the Hanbyeol Archipelago network, a fourteen-route system connecting three mainland terminals to twenty-two inhabited islands. Using an operator-supplied schedule log of 41,286 scheduled sailings between January 2019 and December 2024, we classify each cancellation by recorded cause and estimate a logistic model of cancellation probability. The overall cancellation rate was 9.5 percent, but the figure conceals wide variation: routes served by vessels under 300 gross tonnage cancelled at 14.8 percent, while routes served by vessels above 1,000 gross tonnage cancelled at 4.1 percent. Wind speed dominates the model, but its effect is strongly conditioned on vessel size, and the gap widens sharply above 12 metres per second. We also find that cancellations cluster in the afternoon on routes whose vessels complete four or more round trips per day, a pattern consistent with schedule recovery failure rather than weather alone. We argue that reliability policy for island transport should treat vessel allocation and schedule density as instruments of equal standing to weather thresholds.

**Keywords:** coastal shipping, passenger ferry, service reliability, cancellation, island accessibility

---

## 1. Introduction

For residents of small islands, the scheduled ferry is not one transport option among several. It is the only means of reaching a hospital, a secondary school, or an administrative office on the mainland. A cancelled sailing is therefore not an inconvenience of the kind experienced by a delayed commuter; it is the temporary removal of access to public services for an entire community. Despite this, the literature on coastal passenger shipping has concentrated on fare structures and subsidy design, and has treated reliability as a background condition rather than an object of study in its own right.

Two assumptions have gone largely unexamined. The first is that cancellations are exogenous, driven by weather that operators cannot control and policy cannot influence. The second is that cancellation risk is uniform across a network, so that a single regulatory wind threshold applied to all vessels produces equitable outcomes. If smaller vessels are systematically assigned to thinner routes, and if smaller vessels are grounded at lower wind speeds, then the communities with the weakest transport links will also face the least reliable ones. Weather would then be the proximate cause of cancellation while vessel allocation remained the underlying one.

This paper tests that proposition on a single network over six years. We ask three questions. First, how much does cancellation risk vary across routes once weather is accounted for? Second, does vessel size condition the effect of wind rather than merely shifting it? Third, do cancellations propagate within a day, so that an early disruption produces later cancellations that weather alone does not explain?

---

## 2. Data and Method

Our data come from the operating logs of the Hanbyeol Archipelago network, obtained under a research agreement with the three operators serving the region. The network comprises fourteen routes departing from three mainland terminals and calling at twenty-two inhabited islands. The observation window runs from 1 January 2019 to 31 December 2024 and contains 41,286 scheduled sailings.

Each record contains the scheduled departure time, the route identifier, the vessel identifier, an operating status, and, where the sailing did not operate, a cause code entered by the terminal supervisor. Six cause codes are in use: adverse sea state, fog and restricted visibility, mechanical fault, insufficient passenger load, port or berth unavailability, and other. We treat a sailing as cancelled when the status field records no departure, regardless of whether a replacement sailing was later provided.

Weather observations were matched to each sailing from the automated coastal station nearest to the departure terminal, using the hourly record closest to the scheduled departure time. Three variables were retained: mean wind speed in metres per second, significant wave height in metres, and horizontal visibility in kilometres. Vessels were grouped into three size classes by gross tonnage: under 300, 300 to 1,000, and above 1,000.

We estimate a logistic regression in which the dependent variable is cancellation. Covariates comprise wind speed, wave height, visibility, vessel size class, an interaction between wind speed and size class, the ordinal position of the sailing within the vessel's daily schedule, and fixed effects for route and for month of year. Standard errors are clustered by route. Because sailings on the same vessel and day are plainly not independent, we also report a specification with vessel-day random effects; the coefficients reported below are stable across both.

Two limitations should be stated. Cause codes are entered by supervisors under operational pressure and are known to under-record mechanical faults, which are sometimes logged as sea state. And the network contains no route on which vessels of different size classes operate under identical conditions, so the size effect cannot be fully separated from unobserved route characteristics.

---

## 3. Results

The overall cancellation rate across the six-year window was 9.5 percent, or 3,912 of 41,286 scheduled sailings. Table 1 disaggregates this figure by vessel size class and by recorded cause.

**Table 1. Cancellation rate and recorded cause by vessel size class, 2019–2024**

| Vessel size class | Scheduled sailings | Cancelled | Rate (%) | Sea state (%) | Fog (%) | Mechanical (%) | Other (%) |
|---|---|---|---|---|---|---|---|
| Under 300 GT | 14,902 | 2,206 | 14.8 | 71.3 | 14.2 | 8.9 | 5.6 |
| 300–1,000 GT | 16,470 | 1,318 | 8.0 | 66.8 | 17.4 | 10.1 | 5.7 |
| Above 1,000 GT | 9,914 | 388 | 3.9 | 52.1 | 26.8 | 14.3 | 6.8 |
| All vessels | 41,286 | 3,912 | 9.5 | 67.9 | 16.6 | 9.8 | 5.7 |

The rate on the smallest vessels is 3.8 times that on the largest. The composition of causes also shifts: sea state accounts for 71.3 percent of cancellations on small vessels but only 52.1 percent on large ones, where fog becomes proportionally more important. This is consistent with large vessels remaining operable in wind conditions that ground small ones, while visibility limits bind on all vessels alike.

Table 2 reports the estimated marginal effect of wind speed on cancellation probability, evaluated at three wind levels and holding wave height, visibility, and schedule position at their sample means.

**Table 2. Predicted cancellation probability by wind speed and vessel size class (percentage points)**

| Wind speed | Under 300 GT | 300–1,000 GT | Above 1,000 GT | Gap (small − large) |
|---|---|---|---|---|
| 6 m/s | 4.2 | 3.1 | 2.4 | 1.8 |
| 10 m/s | 18.7 | 9.6 | 5.3 | 13.4 |
| 14 m/s | 52.4 | 27.9 | 11.6 | 40.8 |

The gap between the smallest and largest classes is 1.8 percentage points at 6 metres per second and 40.8 points at 14 metres per second. Wind does not simply raise cancellation risk for all vessels; it separates them. The divergence becomes pronounced above roughly 12 metres per second, which is close to the threshold at which the smallest class is administratively restricted.

Schedule position produces a second, smaller effect. On routes whose vessels complete four or more round trips per day, the fourth and later sailings carry a cancellation probability 6.3 percentage points above the first sailing of the same day, after weather is controlled for. On routes with three or fewer round trips the equivalent difference is 1.1 points and is not statistically distinguishable from zero. Roughly 22 percent of cancellations on high-density routes occur on sailings for which the matched weather record falls below every applicable operating threshold.

---

## 4. Discussion

The results support the argument set out in the introduction. Cancellation is not a uniform consequence of weather. It is the product of an interaction between weather and the operating capability of the vessel assigned to a route, and vessel assignment is a decision made by operators and regulators rather than by the sea.

This matters because assignment is not random. In the Hanbyeol network, the smallest vessels serve the routes with the fewest passengers, which are also the routes to the smallest and most remote communities. Those communities therefore experience both the thinnest schedule and the least reliable one. A regulatory framework that sets wind thresholds by vessel class, and does nothing else, will reproduce this pattern indefinitely while appearing neutral, because each individual decision to cancel is defensible on safety grounds.

The schedule position result points to a second, more tractable problem. On high-density routes, a fifth of cancellations occur in conditions that would not have justified cancelling the first sailing of the day. The most plausible reading is schedule recovery failure: a delay early in the day consumes the turnaround margin, and by the afternoon the only way to restore the timetable is to drop a sailing. If that reading is correct, the remedy is not a weather rule but a schedule with recoverable slack, which is a design question rather than a safety one.

We note that our cause codes cannot confirm this mechanism directly, since a cancellation caused by accumulated delay may well be logged under sea state if conditions were marginal. Distinguishing the two would require turnaround timestamps, which the present dataset does not contain.

---

## 5. Conclusion

Across 41,286 scheduled sailings on the Hanbyeol Archipelago network, we find a cancellation rate of 9.5 percent that varies from 3.9 to 14.8 percent by vessel size class. Wind speed is the dominant predictor, but its effect is conditional: at 14 metres per second the predicted cancellation probability differs by nearly 41 percentage points between the smallest and largest vessels. On routes with four or more daily round trips, later sailings are cancelled at materially higher rates than weather alone explains.

Three implications follow. Reliability should be measured and reported per route rather than per network, since network averages conceal the communities most at risk. Vessel allocation should be treated as a reliability instrument, not only as a capacity decision. And schedule density should be evaluated against recoverability, not only against demand.

Further work should extend the analysis to networks with different vessel mixes and should incorporate turnaround timestamps to test the schedule recovery mechanism directly.

---

## References

Ahn, S., & Baek, J. (2021). Subsidy design for lifeline island shipping services. *Review of Coastal Economics*, 12(3), 201–224.

Cho, Y. (2020). *Operating reliability in small-vessel passenger transport*. Seorim Institute of Ocean Policy Working Paper 20-07.

Han, D., Lim, G., & Park, S. (2023). Weather thresholds and discretionary cancellation in scheduled maritime services. *Journal of Coastal Transport Systems*, 16(1), 44–68.

Kwon, H., & Ryu, T. (2022). Delay propagation in high-frequency ferry schedules. *Transport Operations Research Letters*, 5(4), 310–329.

Oh, K., & Seo, H. (2022). Cause coding practices in maritime operating logs. *Maritime Data Quality*, 3(1), 17–35.

Yun, B. (2021). Vessel size, sea state, and the limits of a uniform safety rule. *Review of Coastal Economics*, 13(1), 55–78.
