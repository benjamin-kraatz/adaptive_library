import 'dart:io';

import 'package:flutter/material.dart';

enum AdaptiveState { Cupertino, Material }

class AdaptiveInheritance extends InheritedWidget {
  static AdaptiveState getStateByPlatform() {
    return Platform.isAndroid
        ? AdaptiveState.Material
        : Platform.isIOS ? AdaptiveState.Cupertino : AdaptiveState.Material;
  }

  const AdaptiveInheritance({
    Key key,
    @required this.adaptiveState,
    @required Widget child,
  })  : assert(adaptiveState != null,
            'You need to set an adaptive state (Cupertino or Material) in order to use this inherited widget.'),
        assert(child != null, 'Specify a child widget!'),
        super(key: key, child: child);

  final AdaptiveState adaptiveState;

  static AdaptiveInheritance of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType() as AdaptiveInheritance;
  }

  @override
  bool updateShouldNotify(AdaptiveInheritance oldWidget) {
    return adaptiveState != oldWidget.adaptiveState;
  }
}
