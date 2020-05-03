import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Use this class as your app.
/// Some parameters are going to be added.
/// Make sure to wrap this widget inside [AdaptiveInheritance] directly.
///
/// ```dart
/// AdaptiveInheritance(
///      adaptiveState: AdaptiveInheritance.getStateByPlatform(), //this is used to automatically get the platform the app is running on
///      child: AdaptiveApp(
///        materialTheme: ThemeData(
///            accentColor: Colors.red,
///            buttonTheme: ButtonThemeData(
///              buttonColor: Colors.red,
///            )),
///        home: HomeScreenPage(),
///      ),
///    );
///
/// ```
class AdaptiveApp extends StatelessWidget {
  /// Your app's title.
  final String title;

  /// This little badge in the top right corner. True by default.
  final bool debugShowCheckedModeBanner;

  /// Your app widget tree.
  final Widget home;

  /// To specify theme data for a Material app, use this field.
  final ThemeData materialTheme;

  final ThemeData materialDarkTheme;

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

  /// The application's top-level routing table.
  ///
  /// When a named route is pushed with [Navigator.pushNamed], the route name is
  /// looked up in this map. If the name is present, the associated
  /// [WidgetBuilder] is used to construct a [MaterialPageRoute] that performs
  /// an appropriate transition, including [Hero] animations, to the new route.
  ///
  /// {@macro flutter.widgets.widgetsApp.routes}
  final Map<String, WidgetBuilder> routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver> navigatorObservers;

  AdaptiveApp({
    Key key,
    this.materialTheme,
    this.cupertinoTheme,
    this.debugShowCheckedModeBanner = true,
    this.title,
    @required this.home,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[
      Locale('de', 'DE'),
      Locale('en', 'US'),
    ],
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.materialDarkTheme,
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
            navigatorObservers: navigatorObservers,
            darkTheme: materialDarkTheme,
            initialRoute: initialRoute,
            routes: routes,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
          )
        : CupertinoApp(
            theme: cupertinoTheme,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            home: home,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            navigatorObservers: navigatorObservers,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
          );
  }
}
