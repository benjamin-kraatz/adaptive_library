# adaptive_library

A set of Widgets that create a native look and feel on iOS and Android.

Flutter already gives us a great library for Material and Cupertino widgets.
But as a cross platform tool, Flutter does *not* provide a good way of displaying the right widget design types on each platform dynamically.

*adaptive_library* crashes in and... *here it is!* 

## Getting Started

To get started, import the package to your app, after [getting the package](https://pub.dev/packages/adaptive_library).

```dart
import 'package:adaptive_library/adaptive_library.dart';
```

## The widgets

Our library currently contains 7 widgets that can be used to create a native look and feel on iOS and Android devices.
There are more in the future, so stay tuned.

***Most of the time, you can replace the base class name of a widget with the ones from this library. You do not need to rename or remove parameters; though at some points you eventually need to add one parameter***
*(This makes adaptive_library great, huh?)*

### Important things in advance

adaptive_library uses the concept of `InheritedWidget` to get access to the current platform. This makes sure that you do not need to reenter `Platform.isAndroid || Platform.isIOS` or whatever, every time you need a widget. And yes, "Fluttering" is done by widgets, so this would be... nah. ;)

### AdaptiveInheritance

`AdaptiveInheritance` is the core class. Every adaptive widget needs it, because it defines the Platform "state" (-> Android or iOS).

```dart
AdaptiveInheritance(
      adaptiveState: AdaptiveState.Cupertino,
      child: AdaptiveApp(
          //
      ),
    );
```

Typically, AdaptiveInheritance is the parent of the whole app. It enabled the functionality to reload all the widgets that are based on Platform state at the same time.

`adaptiveState` is set by an enum containing the fields; ***and if you want to set it dynamically, simply call `AdaptiveInheritance.getStateByPlatform()`***.
This method uses Dart's io package to find out which Platform the app is currently running on, providing the correct AdaptiveState.


In this example, the direct child is AdaptiveApp, that combines `MaterialApp` and `CupertinoApp`.

### AdaptiveApp

```dart
AdaptiveApp(
        home: HomeScreenPage(),
      )
```

Use this to enable Material or Cupertino design for your app.
Like the "originals", you can set parameters like `debugShowCheckedModeBanner` and `home` to define your app.
The full list of parameters are growing, and can be inspected in the class.

#### Theming

`materialTheme` and `cupertinoTheme` is used to apply the correct themeData to your app.


### AdaptiveScaffold

This is a cool thing.

```dart
AdaptiveScaffold(
      title: Text('Tests Page'),
      body: Text('Your content'),
      actions: []
    )
```

This is a replacement for `Scaffold` and `CupertinoScaffold` and combines them both.
The title is set in the `AppBar` (`CupertinoNavigationBar`) and also, actions can be provided via actions field.

On Cupertino, the default `CupertinoNavigationBar` is used. To get one with large title, simply

```dart
AdaptiveScaffold.large(
      //...
    )
```

This has no effect on Material style.

### AdaptiveButton

```dart
AdaptiveButton(
    child: Text('Your child'),
    onPressed: () => null,
)
```

As you can see, you can simply replace `FlatButton`, `CupertinoButton` or other buttons by `AdaptiveButton`. No need to change parameters.

You can specify a color for Material button style, but it is recommended to set via the theme in AdaptiveApp.

#### Raised/filled

The code, by default, creates a `FlatButton` or `CupertinoButton` respectively.
To use raised or filled version, append `.raised` like so:

```dart
AdaptiveButton.raised(
    //...
)
```

### AdaptiveIconButton

```dart
AdaptiveIconButton(
          icon: Icon(Icons.check_circle_outline),
          iconCupertino: Icon(CupertinoIcons.check_mark_circled),
          onPressed: () => null,
        )
```

Flutter currently has no Cupertino equivalent to IconButton, so AdaptiveIconButton makes it.
Provide either an icon to use it on both designs, or define another icon for Cupertino, because CupertinoIcons look a bit different.

***Here, you can also replace `IconButton` by `AdaptiveIconButton` without extra work***


### AdaptiveAlertDialog

*To use a platform based alert dialog, it is recommended to use `AdaptiveAlertDialog.show` instead of using it as a widget.*


```dart
AdaptiveAlertDialog.show<String>(
              context,
              adaptiveState: AdaptiveInheritance.getStateByPlatform(),
              title: Text('Hallo'),
              content: Text('Einfach mal Hallo sagen'),
              actions: [],
            );
```

Unlike the other widgets, you need to set the AdaptiveState manually right now. (*We're working on this*).

`show` uses a generic parameter that lets you specify the data you want to return.
> Notice: Using `closeOnPress` with AdaptiveAlertDialogButton, the dialog is dismissed without any parameter. To get the result of a dialog, go like the normal way and specify it inside the ActionButtons. See next section for more info. 

#### The actions

> Because iOS devices do not have the typical "back" button by default, it is recommended to provide actions to dismiss the dialog.
If you really do not want to use action buttons, set an empty array.


#### Define actions

```dart
actions: [
  AdaptiveAlertDialogButton(
                child: Text('OK'),
                destructive: true,
                onPressed: () {
                    //do stuff here
                },
              ),
  AdaptiveAlertDialogButton(
                closeOnPress: true,
                child: Text('Thanks'),
                onPressed: null,
              ),
]
```

AdaptiveAlertDialogButton decides whether to use a `FlatButton` or a `CupertinoDialogAction`.
You can leave out `onPressed` or set it to null; by setting `closeOnPress` to true, the dialog is dismissed, regardless of `onPressed` being set.
In case `closeOnPress` is set to true, there will be no "return" value passed with `Navigator.pop`

Setting `destructive` enables the typically red colored button that indicates a "destructive/cancel" action in Cupertino styled dialogs.

### AdaptiveProgressIndicator

```dart
AdaptiveProgressIndicator()
AdaptiveProgressIndicator(value: 45)            
```

Either displays a `CircularProgressIndicator` or a `CupertinoActivityIndicator`.
`value` is ignored on Cupertino style.

## What else?

There are more widgets coming up in the future, so keep track!

### I have an idea

Great. Pull requests are very welcome!
