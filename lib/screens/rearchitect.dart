import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/global_nav.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';

final rearchitectNavItem = GlobalNavItem(
  '/rearchitect',
  RearchitectScreen.new,
  (l10n) => l10n.rearchitect,
  (l10n) => l10n.rearchitectDescription,
);

class RearchitectScreen extends StatelessWidget {
  const RearchitectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final navigatorKey = GlobalKey<NavigatorState>();
    final routes = <String, WidgetBuilder>{
      'amber': (context) => const _Detail(color: Colors.amber),
      'blue': (context) => const _Detail(color: Colors.blue),
      'green': (context) => const _Detail(color: Colors.green),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.rearchitect),
      ),
      body: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxWidth < 480) {
          return _MobileLayout(navigatorKey: navigatorKey, routes: routes);
        } else {
          return _LargeLayout(navigatorKey: navigatorKey, routes: routes);
        }
      })),
    );
  }
}

class _Detail extends StatelessWidget {
  final Color color;

  const _Detail({required this.color});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Container(
      color: color,
      child: Center(
        child: ElevatedButton(
          child: const Text('Back'),
          onPressed: () {
            navigator.pop();
          },
        ),
      ),
    );
  }
}

class _DefaultWidgetProvider extends InheritedWidget {
  final WidgetBuilder builder;

  const _DefaultWidgetProvider({
    required super.child,
    required this.builder,
  });

  @override
  bool updateShouldNotify(_DefaultWidgetProvider oldWidget) {
    return !identical(builder, oldWidget.builder);
  }

  static _DefaultWidgetProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_DefaultWidgetProvider>()!;
}

class _DetailNavigator extends StatelessWidget {
  final Key navigatorKey;
  final Map<String, WidgetBuilder> routes;
  final WidgetBuilder defaultWidgetBuiler;

  const _DetailNavigator({
    required this.navigatorKey,
    required this.routes,
    required this.defaultWidgetBuiler,
  });

  @override
  Widget build(BuildContext context) {
    return _DefaultWidgetProvider(
      builder: defaultWidgetBuiler,
      child: Navigator(
        key: navigatorKey,
        initialRoute: '',
        onGenerateRoute: (settings) {
          final builder =
              routes[settings.name] ?? (context) => _DefaultDetail();
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
      ),
    );
  }
}

class _DefaultDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = _DefaultWidgetProvider.of(context);
    return provider.builder(context);
  }
}

class _MobileLayout extends StatelessWidget {
  final Key navigatorKey;
  final Map<String, WidgetBuilder> routes;

  const _MobileLayout({required this.navigatorKey, required this.routes});

  @override
  Widget build(BuildContext context) {
    return _DetailNavigator(
      navigatorKey: navigatorKey,
      routes: routes,
      defaultWidgetBuiler: (context) => const _Menu(),
    );
  }
}

class _Menu extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const _Menu({this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    final contextNavigator = Navigator.of(context);
    return ListView(
      children: [
        ListTile(
          title: const Text('Amber'),
          onTap: () {
            final navigator = navigatorKey?.currentState ?? contextNavigator;
            unawaited(navigator.pushNamed('amber'));
          },
        ),
        ListTile(
          title: const Text('Blue'),
          onTap: () {
            final navigator = navigatorKey?.currentState ?? contextNavigator;
            unawaited(navigator.pushNamed('blue'));
          },
        ),
        ListTile(
          title: const Text('Green'),
          onTap: () {
            final navigator = navigatorKey?.currentState ?? contextNavigator;
            unawaited(navigator.pushNamed('green'));
          },
        ),
      ],
    );
  }
}

class _LargeLayout extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, WidgetBuilder> routes;

  const _LargeLayout({required this.navigatorKey, required this.routes});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: _Menu(navigatorKey: navigatorKey),
        ),
        Expanded(
          flex: 2,
          child: _DetailNavigator(
            navigatorKey: navigatorKey,
            routes: routes,
            defaultWidgetBuiler: (context) => Container(),
          ),
        ),
      ],
    );
  }
}
