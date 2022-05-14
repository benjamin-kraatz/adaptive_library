import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isThreeLine;
  final bool? dense;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final bool selected;

  AdaptiveListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? ListTile(
            title: title,
            subtitle: subtitle,
            isThreeLine: isThreeLine,
            leading: leading,
            trailing: trailing,
            dense: dense,
            enabled: enabled,
            selected: selected,
            onTap: onTap,
            onLongPress: onLongPress,
          )
        : GestureDetector(
            onTap: onTap,
            onLongPress: onLongPress,
            child: _CupertinoListTile(
              title is Text ? (title as Text).data : '',
              null,
              content: subtitle,
              selected: selected,
            ),
          );
  }
}

class _CupertinoListTile extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final String? description;
  final Color backgroundColorDark = Colors.black12;
  final bool? selected;

  const _CupertinoListTile(
    this.description,
    this.title, {
    this.content,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
          ),
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
        color: CupertinoTheme.of(context).brightness == Brightness.dark
            ? backgroundColorDark
            : Color(0xFFEEEFF0),
      ),
      padding: const EdgeInsets.fromLTRB(
        10,
        14,
        5,
        14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: title ??
                Text(
                  description!,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1.1,
                    color: selected != null && selected!
                        ? CupertinoColors.activeBlue
                        : CupertinoTheme.of(context).textTheme.textStyle.color,
                  ),
                ),
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
            flex: 2,
            child: Material(
              textStyle: TextStyle(
                color: selected != null && selected!
                    ? CupertinoColors.activeBlue
                    : Colors.black54,
                fontSize: 15.1,
              ),
              color: Colors.transparent,
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
