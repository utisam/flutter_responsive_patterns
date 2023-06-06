import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/global_nav.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';
import 'package:word_generator/word_generator.dart';

final wrapNavItem = GlobalNavItem(
  '/wrap',
  WrapScreen.new,
  (l10n) => l10n.wrap,
  (l10n) => l10n.wrapDescription,
);

class WrapScreen extends StatelessWidget {
  final wordGenerator = WordGenerator();

  WrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final names = wordGenerator.randomNouns(10);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.wrap),
      ),
      body: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: names.map((s) => Chip(label: Text(s))).toList(),
      ),
    );
  }
}
