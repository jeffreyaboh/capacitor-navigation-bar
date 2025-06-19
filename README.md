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
| Capacitor | V7+ | Supports older versions of capacitor e.g V5+, V6+ |


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

No configuration required for this plugin.

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

| Capacitor Version | Supported |
|-------------------|-----------|
| 7.x               | Yes       |
| 6.x               | Yes       |
| 5.x               | Yes       |
| 4.x               | Yes       |

## Migrating from Other Plugins

If you previously used `capacitor-navigationbar` or other similar plugins, switch to this package for active support and compatibility with the latest Capacitor versions. Update your imports and installation commands as shown above.

## Related Plugins

For status bar control, see the official Capacitor plugin: [@capacitor/status-bar](https://capacitorjs.com/docs/apis/status-bar)
