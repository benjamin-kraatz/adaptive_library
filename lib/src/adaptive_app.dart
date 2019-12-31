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

  /// The delegates for this app's [Localizations] widget.
  ///
  /// The delegates collectively define all of the localized resources for this application's [Localizations] widget.
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;

  /// The list of locales that this app has been localized for.
  ///
  /// By default only the American English locale is supported. Apps should configure this list to match the locales they support.
  final Iterable<Locale> supportedLocales;

  AdaptiveApp({
    Key key,
    this.materialTheme,
    this.cupertinoTheme,
    this.debugShowCheckedModeBanner = true,
    this.title,
    @required this.home,
    this.localizationsDelegates,
    this.supportedLocales,
  })  : assert(home != null, 'AdaptiveApp: A home widget is required.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? MaterialApp(
            theme: materialTheme,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            home: home,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
          )
        : CupertinoApp(
            theme: cupertinoTheme,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            home: home,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
          );
  }
}
