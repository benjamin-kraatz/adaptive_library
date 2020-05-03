## [0.5.1]

* More documentation on AdaptiveApp on how to use it properly.

## [0.5.0]

* Removed deprecated/non-existing types and fields `VisualDensity`, `SmartQuotesType`, `onGenerateInitialRoutes`.
These fields are removed from the Flutter framework and no longer be used in this package. Remove it from your code.

## [0.4.3]

* Fixed borderRadius and padding for Cupertino styled AdaptiveButton

## [0.4.2]

* Fixed `disabledColor != null` assertion issue on AdaptiveButton on Cupertino style

## [0.4.1]

* AdaptiveButton property default value fixes

## [0.4.0]

* `AdaptiveButton.icon` added

## [0.3.8]

* More customization on `AdaptiveButton`

## [0.3.8]

* A set of fields added to Adaptive app to customize it in a more flexible way

## [0.3.7] - AdaptiveTextField fixed

* Default values added like in the original widget

## [0.3.6] - AdaptiveTextField added

* `TextField` and `CupertinoTextField` with almost full control

## [0.3.5] - More customization on Scaffold

* fields `drawer`, `endDrawer`, `backgroundColor`, `floatingActionButton`, `floatingActionButtonLocation`, `floatingActionButtonAnimator` and `bottomNavigationBar` added.

## [0.3.4] - Icon button fixes

* IconButton now contains `color` and `tooltip` fields

## [0.3.3] - Bug fixes

* Do not use *0.3.2* cause it contains a critical issue. Recommended to update to this version

## [0.3.2] - Fields added to RaisedButton

* `AdaptiveButton` has now more properties: `textTheme`, `hoverColor` and `hightlightColor`.

## [0.3.1] - Raised button fixes

* Color property for raised buttons can now be set through the known "color" field directly.

### Deprecated

* AdaptiveButton's `buttonColor` was deprecated since `color` property is used.

## [0.3.0] - Switch added

* Flutter already has a Switch.adaptive, but the platform for this widget cannot dynamically be adjusted.

## [0.2.9+2] - Fix Scaffold crash (2)

* Check if large navBar for Cupertino.

## [0.2.9+1] - Fix Scaffold crash

* Null checks for app bars.

## [0.2.9] - Improved AdaptiveScaffold

* An AppBar is no longer required in AdaptiveScaffold.

## [0.2.8] - Assertions in AdaptiveScaffold removed.

* The're not useful. Title is auto ignored on a null app bar

## [0.2.7] - Assertions in AdaptiveScaffold

* Setting a title on AdaptiveScaffold requires the app bars to be null.
* Not setting a title requires both app bars to be set.

## [0.2.6] - Keys added to all widgets

* All widgets now contain a key parameter.
* AdaptiveScaffold contains a key "scaffoldKey".

## [0.2.5] - Adjust Scaffold's data

* If needed, a custom AppBar or CupertinoNavigationBar can now be used.

## [0.2.4] - ListTile and ProgressIndicator added

* Adding support for adaptive ListTile and ProgressIndicator.

## [0.2.3] - Fixed onPressed null

* Not setting onPressed on AdaptiveAlertDialogButton causes the app to crash

## [0.2.2] - "Zero day patch"

* Improved stability on AdaptiveScaffold
* A guide for AdaptiveScaffold is now in README.md

## [0.2.1] - 02.11.2019

* Initially published version.
* Set of 7 widgets that can easily be used.
* Use README.md as a guide