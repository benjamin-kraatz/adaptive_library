import 'package:flutter/material.dart';

enum AdaptiveState { Cupertino, Material }

class AdaptiveInheritance extends InheritedWidget {
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
    return context.inheritFromWidgetOfExactType(AdaptiveInheritance)
        as AdaptiveInheritance;
  }

  @override
  bool updateShouldNotify(AdaptiveInheritance oldWidget) {
    return adaptiveState != oldWidget.adaptiveState;
  }
}
