import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A button that displays either a [FlatButton] or a [CupertinoButton]
/// ([RaisedButton] or [CupertinoButton.filled] respectively) based on which platform the app
/// is currently running.
class AdaptiveButton extends StatelessWidget {
  /// The button's content
  final Widget child;

  /// The press callback
  final VoidCallback onPressed;

  /// Internally used.
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
