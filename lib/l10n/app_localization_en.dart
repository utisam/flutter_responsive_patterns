import 'app_localization.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get reposition => 'Reposition';

  @override
  String get repositionDescription => 'A way to rearrange widgets depending on whether the display area is landscape or portrait.';

  @override
  String get wrap => 'Wrap';

  @override
  String get wrapDescription => 'Wrap widget can layout widgets like text.';

  @override
  String get rearchitect => 'Re-architect';

  @override
  String get rearchitectDescription => 'Split it into two pages for smaller screens and re-architect them as one for larger screens.';
}
