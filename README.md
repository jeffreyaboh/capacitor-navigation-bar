<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>
<h3 align="center">Navigation Bar</h3>
<p align="center"><strong><code>@ethion/capacitor-navigation-bar</code></strong></p>
<p align="center">
  Capacitor plugin for Navigation Bar manipulation.
</p>
<br/>
<p align="center">
  <img height="450" src="https://github.com/jeffreyaboh/capacitor-navigation-bar/blob/master/demoProject/src/assets/example.gif?raw=true">
</p>

## Version
| Platform  | Version                                      | Remarks                                                          |
| ----------- | ------------------------------------------- | --------------------------------------------------------------- |
| Capacitor | V8+ | Supports Capacitor 8.0.0 and higher |

### Compatibility Matrix

| Platform | Minimum | Recommended |
|----------|---------|-------------|
| Android  | minSdk 24 | compile/target SDK 36 |
| iOS      | iOS 15.0  | Xcode 26+, Swift 5.9 |

Notes:
- Plugin built with Capacitor 8.0.x and Android Gradle Plugin 8.13.0 / Gradle 8.14.3.
- Requires Node.js 22+ and npm 10+.


## Maintainers

| Maintainer  | GitHub                                      | Website                                                          |
| ----------- | ------------------------------------------- | --------------------------------------------------------------- |
| Jeffrey Aboh | [jeffreyaboh](https://github.com/jeffreyaboh) | [Jeffrey Aboh](https://jeffreyaboh.co.uk) |


## Install

```bash
npm install @ethion/capacitor-navigation-bar
npx cap sync
```

## Configuration

No special configuration required. Ensure your project meets these platform baselines:

- Android
  - compileSdk/targetSdk: 36
  - minSdk: 24+
  - Java toolchain: JDK 21+ (Capacitor Android 8 requires JDK 21)
  - Gradle 8.14.3+ / AGP 8.13.0+
  - If using Angular/Ionic, define a Browserslist that includes ChromeAndroid < 91 to avoid modern JS syntax issues on older WebView. Example:

    ```
    # browserslist
    ChromeAndroid >= 79
    Chrome >= 79
    not dead
    ```

- iOS
  - Xcode 26+
  - iOS deployment target 15.0+
  - Swift 5.9+
  - Supports both Swift Package Manager (SPM) and CocoaPods

## API

<docgen-index>

* [`show()`](#show)
* [`hide()`](#hide)
* [`setColor(...)`](#setcolor)
* [`setTransparency(...)`](#settransparency)
* [`getColor()`](#getcolor)
* [`addListener(NavigationBarPluginEvents.SHOW, ...)`](#addlistenernavigationbarplugineventsshow-)
* [`addListener(NavigationBarPluginEvents.HIDE, ...)`](#addlistenernavigationbarplugineventshide-)
* [`addListener(NavigationBarPluginEvents.COLOR_CHANGE, ...)`](#addlistenernavigationbarplugineventscolor_change-)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### show()

```typescript
show() => Promise<void>
```

Display the navigation bar.

--------------------


### hide()

```typescript
hide() => Promise<void>
```

Hide the navigation bar.

--------------------


### setColor(...)

```typescript
setColor(options: ColorParameters) => Promise<void>
```

Change the color of the navigation bar.
*Support alpha hexadecimal numbers.

| Param         | Type                                                        |
| ------------- | ----------------------------------------------------------- |
| **`options`** | <code><a href="#colorparameters">ColorParameters</a></code> |

--------------------


### setTransparency(...)

```typescript
setTransparency(options: { isTransparent: boolean; }) => Promise<void>
```

Set the Transparency

| Param         | Type                                     |
| ------------- | ---------------------------------------- |
| **`options`** | <code>{ isTransparent: boolean; }</code> |

--------------------


### getColor()

```typescript
getColor() => Promise<{ color: string; }>
```

Gets the current color of the navigation bar in Hexadecimal.

**Returns:** <code>Promise&lt;{ color: string; }&gt;</code>

--------------------


### addListener(NavigationBarPluginEvents.SHOW, ...)

```typescript
addListener(event: NavigationBarPluginEvents.SHOW, listenerFunc: () => void) => Promise<PluginListenerHandle>
```

Event fired after navigation bar is displayed

| Param              | Type                                                                                 | Description |
| ------------------ | ------------------------------------------------------------------------------------ | ----------- |
| **`event`**        | <code><a href="#navigationbarpluginevents">NavigationBarPluginEvents.SHOW</a></code> | The event   |
| **`listenerFunc`** | <code>() =&gt; void</code>                                                           | Callback    |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### addListener(NavigationBarPluginEvents.HIDE, ...)

```typescript
addListener(event: NavigationBarPluginEvents.HIDE, listenerFunc: () => void) => Promise<PluginListenerHandle>
```

Event fired after navigation bar is hidden

| Param              | Type                                                                                 | Description |
| ------------------ | ------------------------------------------------------------------------------------ | ----------- |
| **`event`**        | <code><a href="#navigationbarpluginevents">NavigationBarPluginEvents.HIDE</a></code> | The event   |
| **`listenerFunc`** | <code>() =&gt; void</code>                                                           | Callback    |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### addListener(NavigationBarPluginEvents.COLOR_CHANGE, ...)

```typescript
addListener(event: NavigationBarPluginEvents.COLOR_CHANGE, listenerFunc: (returnObject: { color: string; }) => void) => Promise<PluginListenerHandle>
```

Event fired after navigation bar color is changed

| Param              | Type                                                                                         | Description |
| ------------------ | -------------------------------------------------------------------------------------------- | ----------- |
| **`event`**        | <code><a href="#navigationbarpluginevents">NavigationBarPluginEvents.COLOR_CHANGE</a></code> | The event   |
| **`listenerFunc`** | <code>(returnObject: { color: string; }) =&gt; void</code>                                   | Callback    |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt;</code>

--------------------


### Interfaces


#### ColorParameters

| Prop              | Type                 | Description                                                               |
| ----------------- | -------------------- | ------------------------------------------------------------------------- |
| **`color`**       | <code>string</code>  | Sets the new color of the navigation bar.                                 |
| **`darkButtons`** | <code>boolean</code> | Sets whether the default navigation bar buttons should be black or white. |


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |


### Enums


#### NavigationBarPluginEvents

| Members            | Value                        | Description                                  |
| ------------------ | ---------------------------- | -------------------------------------------- |
| **`SHOW`**         | <code>'onShow'</code>        | Called after the navigation bar is displayed |
| **`HIDE`**         | <code>'onHide'</code>        | Called after navigation bar is hidden        |
| **`COLOR_CHANGE`** | <code>'onColorChange'</code> | Called after navigation bar color is changed |

</docgen-api>

## Usage Example

```typescript
import { NavigationBar, NavigationBarPluginEvents } from '@ethion/capacitor-navigation-bar';

// Show the navigation bar
await NavigationBar.show();

// Hide the navigation bar
await NavigationBar.hide();

// Set navigation bar color
await NavigationBar.setColor({ color: '#FF0000', darkButtons: true });

// Set transparency
await NavigationBar.setTransparency({ isTransparent: true });

// Listen for events
NavigationBar.addListener(NavigationBarPluginEvents.SHOW, () => {
  console.log('Navigation bar is shown');
});
```

## Compatibility

| Capacitor Version | Plugin Version | Install Command |
|-------------------|----------------|-----------------|
| 8.x               | 8.x            | `npm i @ethion/capacitor-navigation-bar@8` |
| 7.x               | 7.x            | `npm i @ethion/capacitor-navigation-bar@7` |
| 6.x               | 6.x            | `npm i @ethion/capacitor-navigation-bar@6` |
| 5.x               | 5.x            | `npm i @ethion/capacitor-navigation-bar@5` |

### Using with Older Capacitor Versions

If you're using Capacitor 5, 6, or 7, install the matching plugin version:

```bash
# For Capacitor 7
npm install @ethion/capacitor-navigation-bar@7
npx cap sync

# For Capacitor 6
npm install @ethion/capacitor-navigation-bar@6
npx cap sync

# For Capacitor 5
npm install @ethion/capacitor-navigation-bar@5
npx cap sync
```

Each major plugin version is aligned with the corresponding Capacitor major version and includes platform-specific requirements for that version.

## Migrating to v8

If upgrading from v7 or earlier:

1. Update your project to Capacitor 8 first ([migration guide](https://capacitorjs.com/docs/updating/8-0))
2. Update your dependencies:
   ```bash
   npm install @ethion/capacitor-navigation-bar@8
   npx cap sync
   ```
3. Ensure your project meets the minimum requirements:
   - **Android**: minSdk 24, targetSdk 36, Java 21, Gradle 8.14.3+
   - **iOS**: iOS 15.0+, Xcode 26+, Swift 5.9+
   - **Node.js**: 22+

## Demo project

This repo includes a minimal Ionic Angular demo in `demoProject/` pre-wired to the local plugin for development:

- Ensure you’ve built the plugin once at the repo root: `npm run build`
- Install demo deps and link local plugin:
  - `cd demoProject`
  - `npm install`
  - `npx cap sync`
- Android: open `demoProject/android` in Android Studio, or run Gradle build
- iOS: `cd demoProject/ios && pod install` then open `App.xcworkspace` in Xcode (or use SPM)

Notes:
- Demo targets Capacitor 8 and Android SDK 36 / iOS 15+.
- Supports both Swift Package Manager (SPM) and CocoaPods for iOS.

## Related Plugins

For status bar control, see the official Capacitor plugin: [@capacitor/status-bar](https://capacitorjs.com/docs/apis/status-bar)

For edge-to-edge and system bars control in Capacitor 8, see: [@capacitor/system-bars](https://capacitorjs.com/docs/apis/system-bars)
