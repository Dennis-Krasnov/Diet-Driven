<p align="center">
  <img src="https://denniskrasnov.com/img/logo.png" width="200"> <!-- width="200" -->
</p>

# Diet Driven

[![Github stars](https://img.shields.io/github/stars/Dennis-Krasnov/Diet-Driven?style=flat)](https://github.com/Dennis-Krasnov/Diet-Driven)
[![Open source license](https://img.shields.io/github/license/Dennis-Krasnov/Diet-Driven.svg?style=flat)](https://github.com/Dennis-Krasnov/Diet-Driven/blob/develop/LICENSE)
<!-- [![Codemagic build status](https://api.codemagic.io/apps/5d8d561b6fd630197006310b/5d8d561b6fd630197006310a/status_badge.svg)](https://codemagic.io/apps/5d8d561b6fd630197006310b/5d8d561b6fd630197006310a/latest_build) -->

<!-- [![codecov](https://codecov.io/gh/Dennis-Krasnov/Diet-Driven/branch/bloc/graph/badge.svg)](https://codecov.io/gh/Dennis-Krasnov/Diet-Driven) -->

Diet Driven is a highly customizable calorie counter mobile app for iOS and Android.

Created in frustration of current solutions and their lack of features and customization, Diet Driven focuses on the needs of a power user.

<!-- <a href='https://play.google.com/store/apps/details?id=com.thamaraiselvam.numbers&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img width="300" height="100" alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png'/></a>
TODO: make it scaled down version of proper aspect ratio -->

<!-- ## Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/0.png" width="256">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/1.png" width="256">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/2.png" width="256">
</p> -->

## Features
* **Food record logging**: objectively keep track of how much you've eaten.
* **Real-time database**: your data is synchronized in real-time, works while offline.
* **Highly customizable**: personalize everything from theme to core functionality.
* **Fully deep linkable**: use deep links to navigate to any part of the app.
* **Clean user interface**: countless hours were spent optimizing the usability of the UI.
* **Configurable at runtime**: configure app parameters without releasing new versions.
* **Complete in-app usage logs**: see exactly what the app's doing from within the app.
* **End-to-end tested**: have confidence everything works as it should.

## Architecture
### High-level
##### System Context Diagram
![System Context Diagram](./diagrams/system_context_diagram.png)

##### Container Diagram
![Container Diagram](./diagrams/container_diagram.png)

##### Navigation Diagram
![Navigation Diagram](./diagrams/navigation_diagram.png)

### Bloc-level
##### Food Diary & Day Bloc
![Food Diary & Day Bloc Diagram](./diagrams/food_diary_day_bloc_diagram.png)

##### Search Bloc
![Search Bloc Diagram](./diagrams/search_bloc_diagram.png)


## Monorepo Structure
##### [Flutter App](https://github.com/Dennis-Krasnov/Diet-Driven/tree/develop/flutter_app)
Flutter mobile application and bloc backend.

##### [Firebase](https://github.com/Dennis-Krasnov/Diet-Driven)
Firebase configurations and serverless functions. 

##### [Bloc Logging](https://github.com/Dennis-Krasnov/Diet-Driven/tree/develop/bloc_logging)
Logging package made to work well with bloc architecture.

##### [Flutter Deep Link Navigation](https://github.com/Dennis-Krasnov/Flutter-Deep-Link-Navigation)
Provides an elegant abstraction for complete deep linking navigation in Flutter.

I separated the navigation system from Diet Driven into its own package and published it.

## Building from Source
* [Install Flutter](https://flutter.dev/docs/get-started/install)
* [Configure Firebase](https://firebase.google.com/docs/flutter/setup)
* [In the future: Nutrition Database](...)

<!-- * [Congigure key.properties]() -->

##### Contributing
Feel free to add issues with bugs or ideas. Any pull requests are very welcome!

##### Author
[Dennis Krasnov](https://denniskrasnov.com)