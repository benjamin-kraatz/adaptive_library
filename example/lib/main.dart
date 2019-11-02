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
      adaptiveState:
          AdaptiveState.Cupertino, // AdaptiveInheritance.getStateByPlatform(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AdaptiveProgressIndicator(),
            AdaptiveListTile(
              title: Text('Brightness'),
              subtitle: Text('Change brightness'),
              onTap: () {
                AdaptiveAlertDialog.show(
                  context,
                  adaptiveState: AdaptiveInheritance.getStateByPlatform(),
                  title: Text('Brightness cannot be set'),
                  content: Text('Truly, this is only an example application.'),
                  actions: [
                    AdaptiveAlertDialogButton(
                      child: Text("I'll try my phone app"),
                      onPressed: null,
                    ),
                  ],
                );
              },
            ),
            AdaptiveIconButton(
              icon: Icon(Icons.check_circle_outline),
              iconCupertino: Icon(CupertinoIcons.check_mark_circled),
              onPressed: () async {
                String res = await AdaptiveAlertDialog.show<String>(
                  context,
                  adaptiveState: AdaptiveInheritance.getStateByPlatform(),
                  title: Text('Just saying hello'),
                  content: Text('Your content in a dialog goes here.'),
                  actions: [
                    AdaptiveAlertDialogButton(
                      child: Text('OK'),
                      closeOnPress: false,
                      destructive: true,
                      onPressed: () {
                        //do stuff here
                        Navigator.pop(context, "ok-press");
                      },
                    ),
                    AdaptiveAlertDialogButton(
                      closeOnPress: true,
                      child: Text('Hello!'),
                      onPressed: null,
                    ),
                    AdaptiveAlertDialogButton(
                      child: Text('Thanks'),
                      onPressed: null,
                    ),
                  ],
                );

                print('result: $res');

                if (res == null) return;

                AdaptiveAlertDialog.show(
                  context,
                  adaptiveState: AdaptiveInheritance.getStateByPlatform(),
                  title: Text('Pressed OK?'),
                  content: Text('We see everything...'),
                  actions: [
                    AdaptiveAlertDialogButton(
                      child: Text('Cool...'),
                      onPressed: null,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
