# TicketMaster

A new Flutter project.

## Getting Started

This guide walks you through getting the project up and running on Windows or macOS. We’ll cover:

1. [Cloning the Repository](#1-cloning-the-repository)
2. [Installing Flutter](#2-installing-flutter)
3. [Setting Up FVM](#3-setting-up-fvm)
4. [Installing Dependencies](#5-installing-dependencies)
5. [Running the Application](#6-running-the-application)
6. [Directory Structure](#7-directory-structure)
7. [Testing & Code Generation](#8-directory-structure)
8. [Questions or Issues?](#9-questions-or-issues)

## 1. Cloning the Repository

By default, `main` is considered the stable branch, while `develop` is the active development branch. **Feature** or **hotfix** branches are created as needed and deleted once merged.

- To check out the develop branch directly:

  ```bash
  git clone -b develop https://github.com/djoks/ticketmaster.git
  cd ticketmaster
  ```

- Or simply clone the repo and then switch branches:
  
  ```bash
  git clone https://github.com/djoks/ticketmaster.git
  cd ticketmaster
  git checkout develop
  ```

## 2. Installing Flutter

### Windows

- Follow the Windows install docs to download and extract the **Flutter SDK** from the [official website](https://docs.flutter.dev/get-started/install).
- Extract the Flutter SDK to a preferred location (e.g., `C:\src\flutter`).
- Add the `flutter/bin` directory to your system `PATH`.

### MacOS

- Follow the MacOS install docs to download and extract the **Flutter SDK** from the [official website](https://docs.flutter.dev/get-started/install).
- Unzip or clone Flutter into a local directory (e.g., `~/development/flutter`).
- Add `flutter/bin` to your `PATH` in your shell config (e.g., `~/.zshrc` or `~/.bash_profile`).

### Linux

- Follow the Linux install docs to download and extract the **Flutter SDK** from the [official website](https://docs.flutter.dev/get-started/install).
- Add `flutter/bin` to your `PATH` in `~/.bashrc`, `~/.zshrc`, or your preferred shell config.

After installation, verify with:
`fvm flutter doctor`

> If everything is installed correctly, flutter doctor should show no issues found (similar to the sample output shown in the original doc):

```bash
Doctor summary (to see all details, run fvm flutter doctor -v):
[✓] Flutter (Channel stable, 3.27.2, on macOS 15.2 24C101 darwin-x64, locale en-GH)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 16.2)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.3)
[✓] VS Code (version 1.96.3)
[✓] Connected device (3 available)
[✓] Network resources

• No issues found!
```

## 3. Setting Up FVM

[FVM (Flutter Version Management)](https://fvm.app/) helps you manage multiple Flutter SDK versions on a per-project basis.

### Windows

Install via PowerShell or Command Prompt:

```bash
dart pub global activate fvm
```

Make sure you add `C:\Users\<YourUser>\AppData\Local\Pub\Cache\bin` to your `PATH`.

or using [Chocolately](https://chocolatey.org/install)

```
choco install fvm
```

### MacOS

Install via Terminal:

```bash
dart pub global activate fvm
```

Or install view **Homebrew**:

```bash
brew tap leoafarias/fvm
brew install fvm
```

Then add the following to your `.zshrc` or `.bash_profile` (if not installed with Homebrew):

```bash
export PATH="$PATH:$HOME/.pub-cache/bin"
```

### Linux

Install with install.sh

```bash
curl -fsSL https://fvm.app/install.sh | bash
```

or install with **Homebrew**:

```bash
brew tap leoafarias/fvm
brew install fvm
```

### Using FVM

If the project already includes an `.fvmrc` file, run:

```bash
fvm install
fvm use stable
```

Note: `stable` can be replaced with the exact flutter version you would like to use eg `3.16.9`.

## 4. Configuring the Project

1. Copy `.env.example` to `.env`:

   ```bash
   copy .env.example .env
   ```

2. TODO: Get API KEY

## 5. Installing Dependencies

In the project root, install the required packages:

```bash
fvm flutter pub get
```

## 6. Running the Application

To run on a specific device or platform:

```bash
fvm flutter run -d <device_id> --dart-define-from-file=.env
```

- device_id can be **windows**, **macos**, **chrome**, **ios**, **android**, or any emulator/device ID.
- Adjust the path after `--dart-define-from-file=` if your `.env` isn’t in the repo root.

You can get the list of running devices by running the following command in your terminal:

```bash
fvm flutter devices list
```

or with **VS Code**:

- Place a valid `.env` file in your root with correct config values.
- `launch.json` is configured to load `.env` automatically.
- Select a device at the bottom of VS Code, go to “Run” in the toolbar, and choose “Start Debugging.”

## 7. Directory Structure

Here’s a simplified view of the folder layout (omitting untracked or auto-generated folders):

```bash
/
├── .vscode/
│   ├── launch.json
│   └── settings.json
├── README.md
├── SETUP.md
├── analysis_options.yaml
├── android/
│   ├── app/
│   ├── build.gradle
│   └── settings.gradle
├── assets/
│   ├── fonts/
│   ├── images/
│   └── translations/
│       └── ...
│   └── README.md
├── ios/
│   ├── Runner/
│   └── Runner.xcworkspace/
├── lib/
│   ├── app/
│   ├── constants/
│   ├── database/
│   │   ├── daos/
│   │   ├── tables/
│   │   └── app_database.dart
│   ├── main.dart
│   ├── models/
│   ├── providers/
│   ├── repositories/
│   ├── services/
│   ├── ui/
│   │   ├── common/
│   │   ├── views/
│   │   └── widgets/
│   └── utils/
│   └── README.md
├── linux/
│   └── ...
├── macos/
│   └── ...
├── pubspec.lock
├── pubspec.yaml
├── test/
│   └── widget_test.dart
├── web/
│   └── ...
└── windows/
    └── ...
```

### Additional Notes

- Flutter Channel: Confirm you’re on the correct channel (stable, beta, etc.) if the project needs it.
- Desktop Platforms: If you plan to run on desktop platforms (Windows, macOS, or Linux), enable them:

  ```bash
  fvm flutter config --enable-windows-desktop
  fvm flutter config --enable-macos-desktop
  fvm flutter config --enable-linux-desktop
  ```

- Hot Reload and Restart: Use `r` in your terminal or your IDE’s features during development for faster iterations.

## 8. Testing & Code Generation

### Running Tests

- Run all tests:

  ```bash
  fvm flutter test
  ```

- or specify a directory/file:

  ```bash
  fvm flutter test test/widget_test.dart
  ```

### Using Mockito with build_runner

If you need mock classes for testing (e.g., mocking services, repositories, view models), create an annotation file (e.g. `test/mocks/mocks.dart`):

```dart
import 'package:mockito/annotations.dart';
import 'package:ticketmaster/ui/views/home_view_model.dart';

@GenerateNiceMocks([MockSpec<HomeViewModel>()])
void main() {
  ...
}
```

### Generate mocks:

```bash
fvm dart run build_runner build
```

Import and use generated mocks in your tests:

```dart
import 'mocks/mocks.mocks.dart';

void main() {
  final mockVm = MockHomeViewModel();
}
```

This approach automatically creates mock classes for you, eliminating the need to manually override noSuchMethod. You can read more about [Mockito](https://pub.dev/packages/mockito) and [Flutter tests](https://docs.flutter.dev/testing/overview).

## 9. Questions or Issues?

If you run into problems or need more details:

1. Check the official [Flutter documentation](https://docs.flutter.dev/).
2. Contact [Philip.](contact.djoks@gmail.com).
