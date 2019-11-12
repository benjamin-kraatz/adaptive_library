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