import 'package:adaptive_library/src/adaptive_inheritance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveIconButton extends StatelessWidget {
  final Widget icon;
  final Widget? iconCupertino;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;

  AdaptiveIconButton({
    Key? key,
    required this.icon,
    this.tooltip,
    this.iconCupertino,
    this.onPressed,
    this.color,
  })  : assert(icon != null, 'We need an icon to see what is goung on.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? IconButton(
            icon: icon,
            onPressed: onPressed,
            tooltip: tooltip,
            color: color,
          )
        : CupertinoButton(
            child: iconCupertino ?? icon,
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            color: color,
          );
  }
}
