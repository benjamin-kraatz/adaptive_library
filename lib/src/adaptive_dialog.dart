import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAlertDialogButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool closeOnPress;
  final bool destructive;

  AdaptiveAlertDialogButton({
    this.child,
    this.onPressed,
    this.closeOnPress = true,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? FlatButton(
            child: child,
            onPressed: () {
              onPressed();
              if (closeOnPress) {
                Navigator.pop(context);
              }
            },
          )
        : CupertinoDialogAction(
            child: child,
            isDestructiveAction: destructive,
            onPressed: () {
              onPressed();
              if (closeOnPress) {
                Navigator.pop(context);
              }
            },
          );
  }
}

class AdaptiveAlertDialog extends StatefulWidget {
  static void show(BuildContext context,
      {@required AdaptiveState adaptiveState,
      Widget title,
      Widget content,
      List<AdaptiveAlertDialogButton> actions}) {
    assert(
        (adaptiveState == AdaptiveState.Cupertino && actions != null) ||
            adaptiveState == AdaptiveState.Material,
        'It is recommended to provide buttons on Cupertino styled alerts, because iOS devices have no native "back" button like Android devices do. You can of course provide an empty array via []');
    adaptiveState == AdaptiveState.Material
        ? showDialog(
            context: context,
            builder: (_) => AdaptiveAlertDialog(
              title: title,
              content: content,
              actions: actions ?? [],
            ),
          )
        : showCupertinoDialog(
            context: context,
            builder: (_) => AdaptiveAlertDialog(
              title: title,
              content: content,
              actions: actions ?? [],
            ),
          );
  }

  final Widget title;
  final Widget content;
  final List<AdaptiveAlertDialogButton> actions;

  AdaptiveAlertDialog({this.title, this.content, this.actions});

  @override
  _AdaptiveAlertDialogState createState() => _AdaptiveAlertDialogState();
}

class _AdaptiveAlertDialogState extends State<AdaptiveAlertDialog> {
  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? AlertDialog(
            title: widget.title,
            content: widget.content,
            actions: widget.actions.map((ac) {
              return ac;
            }).toList(),
          )
        : CupertinoAlertDialog(
            title: widget.title,
            content: widget.content,
            actions: widget.actions.map((ac) {
              return ac;
            }).toList(),
          );
  }
}
