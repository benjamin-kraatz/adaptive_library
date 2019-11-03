import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Use this class as your app.
/// Some parameters are going to be added.
/// Make sure to wrap this widget inside [AdaptiveInheritance] directly.
class AdaptiveApp extends StatelessWidget {
  /// Your app's title.
  final String title;

  /// This little badge in the top right corner. True by default.
  final bool debugShowCheckedModeBanner;

  /// Your app widget tree.
  final Widget home;

  /// To specify theme data for a Material app, use this field.
  final ThemeData materialTheme;

  /// To specify theme data for a Cupertino app, use this field.
  final CupertinoThemeData cupertinoTheme;

  AdaptiveApp({
    Key key,
    this.materialTheme,
    this.cupertinoTheme,
    this.debugShowCheckedModeBanner = true,
    this.title,
    this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? MaterialApp(
            theme: materialTheme,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            home: home,
          )
        : CupertinoApp(
            theme: cupertinoTheme,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            home: home,
          );
  }
}
