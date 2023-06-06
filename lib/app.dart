import 'package:flutter/material.dart';
import 'package:flutter_responsive_patterns/global_nav.dart';
import 'package:flutter_responsive_patterns/l10n/app_localization.dart';
import 'package:flutter_responsive_patterns/screens/gallery_screen.dart';
import 'package:flutter_responsive_patterns/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'root',
      title: 'Flutter Responsive Patterns',
      // Localization:
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // Theming:
      theme: lightTheme,
      darkTheme: darkTheme,
      // Routing:
      home: const GalleryScreen(),
      routes: Map.fromEntries(
        globalNavItems.map((item) => MapEntry(item.routeName, item)),
      ),
    );
  }
}
