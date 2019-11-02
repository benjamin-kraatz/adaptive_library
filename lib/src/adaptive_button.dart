import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool _raised;

  /// Recommended to use [ThemeData] in [AdaptiveApp] to set the button's color.
  final Color buttonColor;

  AdaptiveButton({
    @required this.child,
    this.onPressed,
    this.buttonColor = Colors.blue,
  })  : assert(child != null, 'Give me a child.'),
        _raised = false;

  AdaptiveButton.raised({
    @required this.child,
    this.onPressed,
    this.buttonColor = Colors.blue,
  })  : assert(child != null, 'Give me a child.'),
        _raised = true;

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? _raised
            ? RaisedButton(
                child: child,
                onPressed: onPressed,
                color: buttonColor,
              )
            : FlatButton(
                child: child,
                onPressed: onPressed,
              )
        : _raised
            ? CupertinoButton.filled(
                child: child,
                onPressed: onPressed,
              )
            : CupertinoButton(
                child: child,
                onPressed: onPressed,
              );
  }
}
