import 'package:adaptive_library/src/adaptive_inheritance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool value) onChanged;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final ImageProvider activeThumbImage;
  final ImageProvider inactiveThumbImage;
  final MaterialTapTargetSize materialTapTargetSize;

  AdaptiveSwitch({
    this.value,
    this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
  });

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? Switch(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            activeThumbImage: activeThumbImage,
            activeTrackColor: activeTrackColor,
            inactiveThumbColor: inactiveThumbColor,
            inactiveThumbImage: inactiveThumbImage,
            inactiveTrackColor: inactiveTrackColor,
            materialTapTargetSize: materialTapTargetSize,
          )
        : CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          );
  }
}
