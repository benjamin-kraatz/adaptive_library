import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveScaffold extends StatefulWidget {
  final Widget title;
  final Widget body;
  final List<Widget> actions;
  final Widget appBar;
  final CupertinoNavigationBar cupertinoNavigationBar;

  final bool largeCupertino;

  AdaptiveScaffold(
      {@required this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar})
      : largeCupertino = false;
  AdaptiveScaffold.large(
      {@required this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar})
      : largeCupertino = true;

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context);

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? Scaffold(
            appBar: widget.appBar ??
                AppBar(
                  title: widget.title,
                  actions: widget.actions,
                ),
            body: widget.body,
          )
        : CupertinoPageScaffold(
            navigationBar:
                widget.cupertinoNavigationBar ?? widget.largeCupertino
                    ? null
                    : CupertinoNavigationBar(
                        middle: widget.title,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.actions ?? [],
                        ),
                      ),
            child: SafeArea(
              child: widget.largeCupertino
                  ? CustomScrollView(
                      slivers: <Widget>[
                        CupertinoSliverNavigationBar(
                          largeTitle: widget.title,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.actions ?? [],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: widget.body,
                        ),
                      ],
                    )
                  : widget.body,
            ),
          );
  }
}
