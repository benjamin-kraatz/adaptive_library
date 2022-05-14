import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveAlertDialogButton extends StatelessWidget {
  /// The button's content
  final Widget child;

  /// The press callback. Can be null.
  final VoidCallback? onPressed;

  /// Being true by default, it says whether to dismiss the dialog regardless of [onPressed] being set.
  final bool closeOnPress;

  /// Only used for [CupertinoDialogAction]; defines a destructive button
  final bool destructive;

  AdaptiveAlertDialogButton({
    required this.child,
    this.onPressed,
    this.closeOnPress = true,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? TextButton(
            child: child,
            onPressed: () {
              if (onPressed != null) onPressed!();
              if (closeOnPress) {
                Navigator.pop(context);
              }
            },
          )
        : CupertinoDialogAction(
            child: child,
            isDestructiveAction: destructive,
            onPressed: () {
              if (onPressed != null) onPressed!();
              if (closeOnPress) {
                Navigator.pop(context);
              }
            },
          );
  }
}

/// Displays a native looking alert dialog.
/// It is recommended to use [AdaptiveAlertDialog.show] instead of using it as a widget.
class AdaptiveAlertDialog extends StatefulWidget {
  /// Show the dialog, having [title] and [content] set. Also, you can set actions.
  /// To get a type or data returned, use [T] to set.
  /// A Future<T> is returned.
  static Future<T?> show<T>(BuildContext context,
      {required AdaptiveState adaptiveState,
      Widget? title,
      Widget? content,
      List<AdaptiveAlertDialogButton>? actions}) {
    assert(
        (adaptiveState == AdaptiveState.Cupertino && actions != null) ||
            adaptiveState == AdaptiveState.Material,
        'It is recommended to provide buttons on Cupertino styled alerts, because iOS devices have no native "back" button like Android devices do. You can of course provide an empty array via []');
    return adaptiveState == AdaptiveState.Material
        ? showDialog<T>(
            context: context,
            builder: (_) => AdaptiveAlertDialog(
              title: title,
              content: content,
              actions: actions ?? [],
            ),
          )
        : showCupertinoDialog<T>(
            context: context,
            builder: (_) => AdaptiveAlertDialog(
              title: title,
              content: content,
              actions: actions ?? [],
            ),
          );
  }

  /// Dialog's title
  final Widget? title;

  /// The dialog's content
  final Widget? content;

  /// The dialog's actions. It is recommended (and asserted) to either provide actions or an empty array for Cupertino styled dialogs.
  final List<AdaptiveAlertDialogButton>? actions;

  AdaptiveAlertDialog({this.title, this.content, this.actions});

  @override
  _AdaptiveAlertDialogState createState() => _AdaptiveAlertDialogState();
}

class _AdaptiveAlertDialogState extends State<AdaptiveAlertDialog> {
  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? AlertDialog(
            title: widget.title,
            content: widget.content,
            actions: widget.actions!.map((ac) {
              return ac;
            }).toList(),
          )
        : CupertinoAlertDialog(
            title: widget.title,
            content: widget.content,
            actions: widget.actions!.map((ac) {
              return ac;
            }).toList(),
          );
  }
}
