import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/global_nav.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Responsive Patterns'),
      ),
      body: _GalleryBody(),
    );
  }
}

class _GalleryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: globalNavItems.map((item) => _GalleryCard(item)).toList(),
    );
  }
}

class _GalleryCard extends StatelessWidget {
  final GlobalNavItem item;

  const _GalleryCard(this.item);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final navigator = Navigator.of(context);

    return Card(
      child: ListTile(
        title: Text(item.resolveTitle(l10n)),
        subtitle: Text(item.resolveDescription(l10n)),
        onTap: () {
          unawaited(navigator.pushNamed(item.routeName));
        },
      ),
    );
  }
}
