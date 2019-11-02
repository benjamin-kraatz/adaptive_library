import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveApp extends StatelessWidget {
  final String title;
  final bool debugShowCheckedModeBanner;
  final Widget home;
  final ThemeData materialTheme;
  final CupertinoThemeData cupertinoTheme;

  AdaptiveApp({
    this.materialTheme,
    this.cupertinoTheme,
    this.debugShowCheckedModeBanner = true,
    this.title,
    this.home,
  });

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
