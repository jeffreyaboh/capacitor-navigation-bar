# Demo Project

This is a minimal Ionic Angular demo wired to the local plugin `@ethion/capacitor-navigation-bar` for development and testing.

## Prerequisites
- Node.js LTS (Node 16/18 recommended for Angular 12 tooling). Newer Node may show engine warnings but will still install.
- Capacitor CLI 7
- Android Studio (SDK 35) and/or Xcode (iOS 13+)

## Setup
1. Build the plugin at the repository root:
   - `npm run build`
2. Install demo dependencies and sync platforms:
   - `npm install`
   - `npx cap sync`

## Run Web
- `npm start` then open http://localhost:4200

## Android
- Ensure Android SDK is configured (e.g., `$HOME/Library/Android/sdk`).
- Open `android/` in Android Studio, or build with Gradle:
  - `cd android`
  - `./gradlew assembleDebug`

## iOS
- `cd ios`
- `pod install`
- Open `App.xcworkspace` in Xcode and run on a simulator/device.

## Notes
- Demo uses Capacitor 7 and Android SDK 35.
- If using a very new Node version, engine warnings from Angular 12 are expected.
