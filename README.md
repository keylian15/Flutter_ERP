<p align="center">
  <img src="assets/flutter_erp-banner.svg" alt="api_basket-banner" width="800">
</p>
<p align="center">
	<img src="https://img.shields.io/github/license/keylian15/Flutter_ERP?style=flat&logo=opensourceinitiative&logoColor=white&color=00fffb" alt="license">
	<img src="https://img.shields.io/github/last-commit/keylian15/Flutter_ERP?style=flat&logo=git&logoColor=white&color=00fffb" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/keylian15/Flutter_ERP?style=flat&color=00fffb" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/keylian15/Flutter_ERP?style=flat&color=00fffb" alt="repo-language-count">
</p>
<p align="center">Built with the tools and technologies:</p>
<p align="center">
	<img src="https://img.shields.io/badge/Swift-F05138.svg?style=flat&logo=Swift&logoColor=white" alt="Swift">
	<img src="https://img.shields.io/badge/HTML5-E34F26.svg?style=flat&logo=HTML5&logoColor=white" alt="HTML5">
	<img src="https://img.shields.io/badge/Gradle-02303A.svg?style=flat&logo=Gradle&logoColor=white" alt="Gradle">
	<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
	<img src="https://img.shields.io/badge/CMake-064F8C.svg?style=flat&logo=CMake&logoColor=white" alt="CMake">
	<img src="https://img.shields.io/badge/C-A8B9CC.svg?style=flat&logo=C&logoColor=black" alt="C">
	<img src="https://img.shields.io/badge/Kotlin-7F52FF.svg?style=flat&logo=Kotlin&logoColor=white" alt="Kotlin">
</p>
<br>

## Table of Contents

- [ Overview](#overview)
- [ Features](#features)
- [ Project Structure](#project-structure)
- [ Getting Started](#getting-started)
  - [ Prerequisites](#prerequisites)
  - [ Installation](#installation)
  - [ Usage](#usage)
  - [ Testing](#testing)
- [ Contributing](#contributing)
- [ Acknowledgments](#acknowledgments)

---

## Overview

This Flutter application was developed to interact with an ERP system. It provides a mobile-friendly interface for accessing and managing enterprise data, allowing users to view, create, and update key information directly from their mobile device. The app aims to simplify access to ERP features and improve workflow efficiency.

---

## Features

- **ERP Integration**  
  Connects seamlessly to the ERP backend to retrieve and manage enterprise data.

- **User-Friendly Interface**  
  Clean and responsive UI designed for mobile use, with smooth navigation and intuitive layouts.

---

## Project Structure

```sh
└── Flutter_ERP/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   │   ├── build.gradle
    │   │   └── src
    │   │       ├── debug
    │   │       │   └── AndroidManifest.xml
    │   │       ├── main
    │   │       │   ├── AndroidManifest.xml
    │   │       │   ├── kotlin
    │   │       │   └── res
    │   │       └── profile
    │   │           └── AndroidManifest.xml
    │   ├── build.gradle
    │   ├── gradle
    │   │   └── wrapper
    │   │       └── gradle-wrapper.properties
    │   ├── gradle.properties
    │   ├── settings.gradle
    │   └── tp3_android.iml
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   │   ├── AppFrameworkInfo.plist
    │   │   ├── Debug.xcconfig
    │   │   └── Release.xcconfig
    │   ├── Runner
    │   │   ├── AppDelegate.swift
    │   │   ├── Assets.xcassets
    │   │   │   ├── AppIcon.appiconset
    │   │   │   │   ├── Contents.json
    │   │   │   │   ├── Icon-App-1024x1024@1x.png
    │   │   │   │   ├── Icon-App-20x20@1x.png
    │   │   │   │   ├── Icon-App-20x20@2x.png
    │   │   │   │   ├── Icon-App-20x20@3x.png
    │   │   │   │   ├── Icon-App-29x29@1x.png
    │   │   │   │   ├── Icon-App-29x29@2x.png
    │   │   │   │   ├── Icon-App-29x29@3x.png
    │   │   │   │   ├── Icon-App-40x40@1x.png
    │   │   │   │   ├── Icon-App-40x40@2x.png
    │   │   │   │   ├── Icon-App-40x40@3x.png
    │   │   │   │   ├── Icon-App-60x60@2x.png
    │   │   │   │   ├── Icon-App-60x60@3x.png
    │   │   │   │   ├── Icon-App-76x76@1x.png
    │   │   │   │   ├── Icon-App-76x76@2x.png
    │   │   │   │   └── Icon-App-83.5x83.5@2x.png
    │   │   │   └── LaunchImage.imageset
    │   │   │       ├── Contents.json
    │   │   │       ├── LaunchImage.png
    │   │   │       ├── LaunchImage@2x.png
    │   │   │       ├── LaunchImage@3x.png
    │   │   │       └── README.md
    │   │   ├── Base.lproj
    │   │   │   ├── LaunchScreen.storyboard
    │   │   │   └── Main.storyboard
    │   │   ├── Info.plist
    │   │   └── Runner-Bridging-Header.h
    │   ├── Runner.xcodeproj
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace
    │   │   │   ├── contents.xcworkspacedata
    │   │   │   └── xcshareddata
    │   │   │       ├── IDEWorkspaceChecks.plist
    │   │   │       └── WorkspaceSettings.xcsettings
    │   │   └── xcshareddata
    │   │       └── xcschemes
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata
    │   │       ├── IDEWorkspaceChecks.plist
    │   │       └── WorkspaceSettings.xcsettings
    │   └── RunnerTests
    │       └── RunnerTests.swift
    ├── lib
    │   ├── api
    │   │   └── api_service.dart
    │   ├── app.dart
    │   ├── main.dart
    │   ├── models
    │   │   └── cart_item.dart
    │   ├── screens
    │   │   ├── article_detail_page.dart
    │   │   ├── cart_page.dart
    │   │   ├── checkout_page.dart
    │   │   └── home_page.dart
    │   ├── services
    │   │   └── cart_manager.dart
    │   └── widgets
    │       └── article_card.dart
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   │   └── CMakeLists.txt
    │   └── runner
    │       ├── CMakeLists.txt
    │       ├── main.cc
    │       ├── my_application.cc
    │       └── my_application.h
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   │   ├── Flutter-Debug.xcconfig
    │   │   └── Flutter-Release.xcconfig
    │   ├── Runner
    │   │   ├── AppDelegate.swift
    │   │   ├── Assets.xcassets
    │   │   │   └── AppIcon.appiconset
    │   │   │       ├── Contents.json
    │   │   │       ├── app_icon_1024.png
    │   │   │       ├── app_icon_128.png
    │   │   │       ├── app_icon_16.png
    │   │   │       ├── app_icon_256.png
    │   │   │       ├── app_icon_32.png
    │   │   │       ├── app_icon_512.png
    │   │   │       └── app_icon_64.png
    │   │   ├── Base.lproj
    │   │   │   └── MainMenu.xib
    │   │   ├── Configs
    │   │   │   ├── AppInfo.xcconfig
    │   │   │   ├── Debug.xcconfig
    │   │   │   ├── Release.xcconfig
    │   │   │   └── Warnings.xcconfig
    │   │   ├── DebugProfile.entitlements
    │   │   ├── Info.plist
    │   │   ├── MainFlutterWindow.swift
    │   │   └── Release.entitlements
    │   ├── Runner.xcodeproj
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace
    │   │   │   └── xcshareddata
    │   │   │       └── IDEWorkspaceChecks.plist
    │   │   └── xcshareddata
    │   │       └── xcschemes
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata
    │   │       └── IDEWorkspaceChecks.plist
    │   └── RunnerTests
    │       └── RunnerTests.swift
    ├── pubspec.yaml
    ├── test
    │   └── widget_test.dart
    ├── tp3.iml
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   │   ├── Icon-192.png
    │   │   ├── Icon-512.png
    │   │   ├── Icon-maskable-192.png
    │   │   └── Icon-maskable-512.png
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        │   └── CMakeLists.txt
        └── runner
            ├── CMakeLists.txt
            ├── Runner.rc
            ├── flutter_window.cpp
            ├── flutter_window.h
            ├── main.cpp
            ├── resource.h
            ├── resources
            │   └── app_icon.ico
            ├── runner.exe.manifest
            ├── utils.cpp
            ├── utils.h
            ├── win32_window.cpp
            └── win32_window.h
```

## Getting Started

### Prerequisites

Before getting started with Flutter_ERP, ensure your runtime environment meets the following requirements:

- **Programming Language:** Dart
- **Package Manager:** Pub, Gradle, Cmake

### Installation

Install Flutter_ERP using one of the following methods:

**Build from source:**

1. Clone the Flutter_ERP repository:

```sh
❯ git clone https://github.com/keylian15/Flutter_ERP
```

2. Navigate to the project directory:

```sh
❯ cd Flutter_ERP
```

3. Install the project dependencies:

**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ pub get
```

### Usage

Run Flutter_ERP using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ dart {entrypoint}
```

### Testing

Run the test suite using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ pub run test
```

---

## Contributing

- **💬 [Join the Discussions](https://github.com/keylian15/Flutter_ERP/discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://github.com/keylian15/Flutter_ERP/issues)**: Submit bugs found or log feature requests for the `Flutter_ERP` project.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/keylian15/Flutter_ERP
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://github.com{/keylian15/Flutter_ERP/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=keylian15/Flutter_ERP">
   </a>
</p>
</details>

---

## Acknowledgments

<a href="https://github.com{/keylian15/Flutter_ERP/}graphs/contributors">
    <img src="https://contrib.rocks/image?repo=keylian15/Flutter_ERP">
</a>
---

_This documentation was generated using [readme-ai](https://readme-ai.streamlit.app)._
