import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Creates either a Scaffold or a CupertinoPageScaffold.
/// Not all fields are used in both, for example [drawer] and [endDrawer].
class AdaptiveScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Widget title;
  final Widget body;
  final List<Widget> actions;
  final Widget appBar;
  final Widget drawer;
  final Widget endDrawer;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final CupertinoNavigationBar cupertinoNavigationBar;
  final Widget bottomNavigationBar;
  final Color backgroundColor;

  final bool largeCupertino;

  AdaptiveScaffold(
      {this.scaffoldKey,
      this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar,
      this.drawer,
      this.endDrawer,
      this.backgroundColor,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.bottomNavigationBar})
      : largeCupertino = false;

  AdaptiveScaffold.large(
      {this.scaffoldKey,
      this.title,
      @required this.body,
      this.actions,
      this.appBar,
      this.cupertinoNavigationBar,
      this.drawer,
      this.endDrawer,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.bottomNavigationBar,
      this.backgroundColor})
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
            key: widget.scaffoldKey,
            appBar: widget.title == null && widget.appBar == null
                ? null
                : widget.appBar ??
                    AppBar(
                      title: widget.title,
                      actions: widget.actions,
                    ),
            body: widget.body,
            bottomNavigationBar: widget.bottomNavigationBar,
          )
        : CupertinoPageScaffold(
            key: widget.scaffoldKey,
            navigationBar:
                widget.title == null && widget.cupertinoNavigationBar == null
                    ? null
                    : widget.cupertinoNavigationBar == null
                        ? widget.largeCupertino
                            ? null
                            : CupertinoNavigationBar(
                                middle: widget.title,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: widget.actions ?? [],
                                ),
                              )
                        : widget.cupertinoNavigationBar,
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
