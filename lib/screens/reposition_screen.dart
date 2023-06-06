import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/global_nav.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';

final repositionNavItem = GlobalNavItem(
  '/reposition',
  RepositionScreen.new,
  (l10n) => l10n.reposition,
  (l10n) => l10n.repositionDescription,
);

class RepositionScreen extends StatelessWidget {
  const RepositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reposition),
      ),
      body: _RepositionLayout(children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
            child: const Text('Main'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
            child: const Text('Properties'),
          ),
        ),
      ]),
    );
  }
}

class _RepositionLayout extends StatelessWidget {
  final List<Widget> children;

  const _RepositionLayout({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxHeight < constraints.maxWidth) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        );
      }
    }));
  }
}
