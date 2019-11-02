import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_library/adaptive_library.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveInheritance(
      adaptiveState: AdaptiveState.Cupertino,
      child: AdaptiveApp(
        materialTheme: ThemeData(
            accentColor: Colors.red,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.red,
            )),
        home: HomeScreenPage(),
      ),
    );
  }
}

class HomeScreenPage extends StatefulWidget {
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: Text('Tester App for AdaptiveLibrary'),
      body: Center(
        child: AdaptiveIconButton(
          icon: Icon(Icons.check_circle_outline),
          iconCupertino: Icon(CupertinoIcons.check_mark_circled),
          onPressed: () {
            AdaptiveAlertDialog.show(
              context,
              adaptiveState: AdaptiveState.Cupertino,
              title: Text('Hallooooo'),
            );
          },
        ),
      ),
    );
  }
}
