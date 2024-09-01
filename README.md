# Tech Quiz

A new Flutter project.

## Getting Started

# Flutter Tech Quiz App

<img width="331" alt="[Screenshot 2024-08-30 at 19 29 14" src="https://github.com/davidjenner/quiz_app/blob/main/screenshot/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-09-01%20at%2012.53.21.png">


## Flutter Doctor

I have an M1 MacBook Air and I'm getting these errors

flutter doctor -v

[!] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
    • Android SDK at /Users/davidjenner/Library/Android/sdk
    ✗ cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/to/macos-android-setup for more details.

[!] Xcode - develop for iOS and macOS (Xcode 15.4)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 15F31d
    ✗ CocoaPods not installed.
        CocoaPods is a package manager for iOS or macOS platform code.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/to/platform-plugins
      For installation instructions, see https://guides.cocoapods.org/using/getting-started.html#installation

## Fixes Tried 30082024

https://guides.cocoapods.org/using/using-cocoapods.html
https://gist.github.com/alloy/62326fcbc5b8ef987c17
https://github.com/flutter/flutter/issues/54962
https://github.com/flutter/flutter/issues/14293
https://brew.sh/
https://stackoverflow.com/questions/64901180/how-to-run-cocoapods-on-apple-silicon-m1
