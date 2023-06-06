import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';
import 'package:flutter_responsive_patterns/screens/rearchitect.dart';
import 'package:flutter_responsive_patterns/screens/reposition_screen.dart';
import 'package:flutter_responsive_patterns/screens/wrap_screen.dart';

class GlobalNavItem {
  final String routeName;
  final Widget Function() createWidget;
  final String Function(AppLocalizations l10n) resolveTitle;
  final String Function(AppLocalizations l10n) resolveDescription;

  const GlobalNavItem(
    this.routeName,
    this.createWidget,
    this.resolveTitle,
    this.resolveDescription,
  );

  Widget call(BuildContext context) => createWidget();
}

List<GlobalNavItem> get globalNavItems => [
      repositionNavItem,
      wrapNavItem,
      rearchitectNavItem,
    ];
