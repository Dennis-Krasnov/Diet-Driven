<p align="center">
  <img src="https://denniskrasnov.com/img/logo.png" width="200"> <!-- width="200" -->
</p>
<h1 align="center">Diet Driven</h2>

<p align="center">
  <a href="https://www.gnu.org/licenses/agpl-3.0.html">
    <img src="https://img.shields.io/github/license/Dennis-Krasnov/Diet-Driven.svg?style=for-the-badge">
  </a>
  &nbsp;
  <a href="https://github.com/Dennis-Krasnov/Diet-Driven">
    <img src="https://img.shields.io/github/stars/Dennis-Krasnov/Diet-Driven.svg?style=for-the-badge">
  </a>
  &nbsp;
  <a href="">
    <img src="https://img.shields.io/badge/Google-PlayStore-green.svg?style=for-the-badge">
  </a>
  &nbsp;
  <a href="">
    <img src="https://img.shields.io/badge/Apple-AppStore-red.svg?style=for-the-badge">
  </a>
</p>

[![codecov](https://codecov.io/gh/Dennis-Krasnov/Diet-Driven/branch/bloc/graph/badge.svg)](https://codecov.io/gh/Dennis-Krasnov/Diet-Driven)
[![Codemagic build status](https://api.codemagic.io/apps/5c06ef582e049200090a4954/5c7871872dea180008e1d030/status_badge.svg)](https://codemagic.io/apps/5c06ef582e049200090a4954/5c7871872dea180008e1d030/latest_build)

...
This is the directory containing the Flutter mobile app...
...

## What is Diet Driven?
Diet Driven is an open source calorie counter app created in frustration of current solutions and their lack of features and customization. Flutter, lalala...

<p align="center">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/0.png" width="256" hspace="4">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/1.png" width="256" hspace="4">
  <img src="https://raw.githubusercontent.com/jesusrp98/spacex-go/master/screenshots/2.png" width="256" hspace="4">
</p>

## Features
* **Food record logging**: objectively keep track of how much you've eaten.
* **Real-time database**: your data is synchronized in real-time, works while offline.
* **Highly customizable**: personalize everything from theme to core functionality.
* **Fully deep linkable**: use deep links to navigate to any part of the app.
* **Clean user interface**: countless hours were spent optimizing the usability of the UI.
* **Configurable at runtime**: configure app parameters without releasing new versions.
* **Complete in-app usage logs**: see exactly what the app's doing from within the app.
* **End-to-end tested**: have confidence everything works as it should.

#### Planned Features
* **Body measurement tracker**: track your body progress over time.
* **Fitness and nutrition reports**: objectify your progress using charts and graphs.
* **Nutritional database agnostic**: easily hook up your own nutrition database.
* **Food meals and recipes**: save time by creating predefined food templates.
* **Location-based food recommendations**: consider the location of where user tracked their foods.
* **Measurement uncertainty**: All calculations consider the uncertainty of user defined data.

## Architecture

### Business Logic Component
Diet Driven uses a BLoC architecture implemented using the [bloc](https://felangel.github.io/bloc/#/) library. Firebase backend...

### Folder Structure
**blocs**: Pure dart business logic using Business Logic design pattern.
**models**: ...
**providers**: ...
**repositories**: ...
**widgets**: ...

## Building from Source
Diet Driven is written in dart and Flutter. See the [installation instructions](https://flutter.dev/docs/get-started/install).

### Firebase
(see ... directory (link) README for firebase instructions)
Create your own Firebase application as seen on this [Firebase codelab](https://codelabs.developers.google.com/codelabs/flutter-firebase/#5). For Android you need to provide own `google-services.json` file. For iOS, you need to provide your own `???` file.

#### Firebase Authentication
Turn on anonymous login and ...

#### Cloud Firestore
...

#### Cloud Functions
...

### Algolia
...

### Docker
...

## Contributing
Feel free to add issues with bugs or ideas. Any pull requests are very
welcome!

#### Author
![Dennis Krasnov](https://denniskrasnov.com/)
