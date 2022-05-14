import 'package:adaptive_library/adaptive_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  /// The button's content
  final Widget child;

  /// The press callback
  final VoidCallback? onPressed;

  /// Internally used.
  final bool _raised;
  final bool _icon;

  /// The button's color
  final Color? color;

  /// This is used on Material only; specifies the appearance of the text in contrast to button's surface color. NOTE: no effect on Cupertino.
  final ButtonTextTheme? textTheme;

  /// The color usually taken for a click/hover. NOTE: no effect on Cupertino.
  final Color? hoverColor;

  /// The color usually taken for a material ripple effect. NOTE: no effect on Cupertino.
  final Color? highlightColor;

  /// Recommended to use [ThemeData] in [AdaptiveApp] to set the button's color.
  @deprecated
  final Color? buttonColor;

  /// The callback that is called when the button is long-pressed.
  ///
  /// If this callback and [onPressed] are null, then the button will be disabled.
  ///
  /// See also:
  ///
  ///  * [enabled], which is true if the button is enabled.
  final VoidCallback? onLongPress;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged]
  /// callback.
  ///
  /// If [onPressed] changes from null to non-null while a gesture is ongoing,
  /// this can fire during the build phase (in which case calling
  /// [State.setState] is not allowed).
  final ValueChanged<bool>? onHighlightChanged;

  /// The color to use for this button's text.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default text color depends on the button theme's text theme,
  /// [ButtonThemeData.textTheme].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [disabledTextColor], the text color to use when the button has been
  ///    disabled.
  final Color? textColor;

  /// The color to use for this button's text when the button is disabled.
  ///
  /// The button's [Material.textStyle] will be the current theme's button
  /// text style, [ThemeData.textTheme.button], configured with this color.
  ///
  /// The default value is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// If [textColor] is a [MaterialStateProperty<Color>], [disabledTextColor]
  /// will be ignored.
  ///
  /// See also:
  ///
  ///  * [textColor] - The color to use for this button's text when the button is [enabled].
  final Color? disabledTextColor;

  /// The fill color of the button when the button is disabled.
  ///
  /// The default value of this color is the theme's disabled color,
  /// [ThemeData.disabledColor].
  ///
  /// See also:
  ///
  ///  * [color] - the fill color of the button when the button is [enabled].
  final Color? disabledColor;

  /// The splash color of the button's [InkWell].
  ///
  /// The ink splash indicates that the button has been touched. It
  /// appears on top of the button's child and spreads in an expanding
  /// circle beginning where the touch occurred.
  ///
  /// The default splash color is the current theme's splash color,
  /// [ThemeData.splashColor].
  ///
  /// The appearance of the splash can be configured with the theme's splash
  /// factory, [ThemeData.splashFactory].
  final Color? splashColor;

  /// The fill color of the button's [Material] when it has the input focus.
  ///
  /// The button changed focus color when the button has the input focus. It
  /// appears behind the button's child.
  final Color? focusColor;

  /// The z-coordinate at which to place this button relative to its parent.
  ///
  /// This controls the size of the shadow below the raised button.
  ///
  /// Defaults to 2, the appropriate elevation for raised buttons. The value
  /// is always non-negative.
  ///
  /// See also:
  ///
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double elevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and a pointer is hovering over it.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and has the input focus.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double focusElevation;

  /// The elevation for the button's [Material] relative to its parent when the
  /// button is [enabled] and pressed.
  ///
  /// This controls the size of the shadow below the button. When a tap
  /// down gesture occurs within the button, its [InkWell] displays a
  /// [highlightColor] "highlight".
  ///
  /// Defaults to 8.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double highlightElevation;

  /// The elevation for the button's [Material] relative to its parent when the
  /// button is not [enabled].
  ///
  /// Defaults to 0.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double disabledElevation;

  /// The theme brightness to use for this button.
  ///
  /// Defaults to the theme's brightness in [ThemeData.brightness]. Setting
  /// this value determines the button text's colors based on
  /// [ButtonThemeData.getTextColor].
  ///
  /// See also:
  ///
  ///  * [ButtonTextTheme], uses [Brightness] to determine text color.
  final Brightness? colorBrightness;

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed]
  /// or [onLongPress] properties to a non-null value.
  bool get enabled => onPressed != null || onLongPress != null;

  /// The internal padding for the button's [child].
  ///
  /// Defaults to the value from the current [ButtonTheme],
  /// [ButtonThemeData.padding].
  final EdgeInsetsGeometry padding;

  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  ///
  /// Defaults to the value from the current [ButtonTheme],
  /// [ButtonThemeData.shape].
  final ShapeBorder shape;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defaults to [Clip.none], and must not be null.
  final Clip clipBehavior;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Defines the duration of animated changes for [shape] and [elevation].
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// ONLY USED ON CUPERTINO
  final BorderRadius? borderRadius;

  /// Used when having an icon button, currently not implemented for Cupertino.
  final Widget? icon;

  /// Used when having an icon button, currently not implemented for Cupertino.
  final Widget? label;

  AdaptiveButton({
    required this.child,
    this.onLongPress,
    this.onHighlightChanged,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.onPressed,
    this.color,
    this.textTheme,
    this.buttonColor,
    this.textColor,
    this.disabledTextColor,
    this.disabledColor,
    this.colorBrightness,
    this.icon,
    this.label,
  })  : _raised = false,
        _icon = false,
        borderRadius = null;

  AdaptiveButton.raised({
    Key? key,
    required this.child,
    this.onLongPress,
    this.onHighlightChanged,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.onPressed,
    this.color,
    this.textTheme,
    this.buttonColor,
    this.textColor,
    this.disabledTextColor,
    this.disabledColor,
    this.colorBrightness,
    this.borderRadius,
    this.icon,
    this.label,
  })  : _raised = true,
        _icon = false,
        super(key: key);

  AdaptiveButton.icon({
    Key? key,
    required this.child,
    this.onLongPress,
    this.onHighlightChanged,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.onPressed,
    this.color,
    this.textTheme,
    this.buttonColor,
    this.textColor,
    this.disabledTextColor,
    this.disabledColor,
    this.colorBrightness,
    this.borderRadius,
    this.icon,
    this.label,
  })  : _raised = true,
        _icon = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveInheritance _inheritance = AdaptiveInheritance.of(context)!;

    return _inheritance.adaptiveState == AdaptiveState.Material
        ? _raised
            ? _icon
                ? ElevatedButton.icon(
                    onPressed: onPressed!,
                    icon: icon!,
                    label: label!,
                    clipBehavior: clipBehavior,
                    focusNode: focusNode!,
                    autofocus: autofocus,
                    key: key!,
                  )
                : ElevatedButton(
                    key: key,
                    child: child,
                    onPressed: onPressed,
                    onLongPress: onLongPress,
                    clipBehavior: clipBehavior,
                    focusNode: focusNode,
                    autofocus: autofocus,
                  )
            : _icon
                ? TextButton.icon(
                    onPressed: onPressed!,
                    icon: icon!,
                    label: label!,
                    key: key!,
                    clipBehavior: clipBehavior,
                    focusNode: focusNode!,
                    autofocus: autofocus,
                  )
                : TextButton(
                    child: child,
                    onPressed: onPressed,
                    key: key,
                    clipBehavior: clipBehavior,
                    focusNode: focusNode,
                    autofocus: autofocus,
                  )
        : _raised
            ? CupertinoButton.filled(
                child: child,
                onPressed: onPressed,
                disabledColor:
                    disabledColor ?? CupertinoColors.quaternarySystemFill,
                padding: padding,
                key: key,
                borderRadius: borderRadius ??
                    const BorderRadius.all(Radius.circular(8.0)),
              )
            : CupertinoButton(
                child: child,
                onPressed: onPressed,
                disabledColor:
                    disabledColor ?? CupertinoColors.quaternarySystemFill,
                padding: padding,
                borderRadius: borderRadius ??
                    const BorderRadius.all(Radius.circular(8.0)),
                key: key,
              );
  }
}
