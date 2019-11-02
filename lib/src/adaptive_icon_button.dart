import 'package:adaptive_library/src/adaptive_inheritance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveIconButton extends StatelessWidget {
  final Widget icon;
  final Widget iconCupertino;
  final VoidCallback onPressed;

  AdaptiveIconButton({
    @required this.icon,
    @required this.iconCupertino,
    this.onPressed,
  }) : assert(icon != null || iconCupertino != null,
            'We need an icon to see what is goung on.');

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? IconButton(
            icon: icon,
            onPressed: onPressed,
          )
        : CupertinoButton(
            child: iconCupertino,
            onPressed: onPressed,
            padding: EdgeInsets.zero,
          );
  }
}
