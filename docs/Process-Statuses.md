# Most Common Process Lifecycle Statuses #

## Structured View ##

| Num | Entity | Status | Info | Icon |
|:---:|:-------|:------:|:-----|:----:|
| :vs:| Service | New | Just created | :new:
| :vs: | Service | Up | Instance is UP and RUNNING | :up:
| :vs: | Service | Free | Free for processing | :free:
| :on: | Build | Queued | You’re in line and your task will be processed soon. Queue time varies depending on number of concurrent tasks available to user. | -
| :large_blue_circle: | Deploy | Building | The Processe's container is being built from Dockerfile. | -
| :white_check_mark: | Deploy | Success | The Process has been built with no issues. | -
| :no_entry: | Deploy | Error | There was an issue with your Process. | -
| :m: | Module | Loaded | - | :soon: |
| :m: | Module | Started | - | :soon: |
| :white_circle: | Service | Run | :moneybag: :euro: :yen: :dollar: :pound: | -
| :white_circle: | Service | Overload | :warning: :crossed_flags: :rotating_light: :vertical_traffic_light: | :beginner: |
| :x: | Service | Stop | :chart_with_downwards_trend: :pill: :swimmer: :smoking: | -
| :parking: | Process | Not&nbsp;Responding | :no_entry_sign: :no_entry: :sos: | -
| :horse_racing: | Service | Restart | :recycle: | :soon:
| :computer: | Host | Reboot | - |:large_orange_diamond: |
| :computer: | Server | Shutoff | - | :electric_plug: |
| :computer: | Server | Sleep | - | :soon: |
| :computer: | Server | Wait | - | -
| :computer: | Server | Hybernate | - | -
| :parking: | Process | Busy | - | :b: |

---

## Simple List View ##

* [ ] **Queued** - You’re in line and your task will be processed soon.
  Queue time varies depending on number of concurrent tasks available to user.
* [ ] **Building** - The image is being built.
* [x] **Success** - The image has been built with no issues.
* [ ] **Error** - There was an issue with your image.

---

:scorpius:
