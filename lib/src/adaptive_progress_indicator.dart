import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  /// This affects only Material's [CircularProgressIndicator]
  final value;

  AdaptiveProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? CircularProgressIndicator(
            value: value,
          )
        : CupertinoActivityIndicator();
  }
}
