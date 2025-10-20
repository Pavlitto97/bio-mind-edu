import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

/// Returns a localized string for a given generated l10n key.
/// Only maps known keys used in sample data; falls back to the key itself otherwise.
String localizeKey(BuildContext context, String key) {
  final l10n = AppLocalizations.of(context);
  if (l10n == null) return key;

  switch (key) {
    // Lessons titles
    case 'lessonsCellTitle':
      return l10n.lessonsCellTitle;
    case 'lessonsPlantTitle':
      return l10n.lessonsPlantTitle;
    case 'lessonsHeartTitle':
      return l10n.lessonsHeartTitle;

    // Lessons descriptions
    case 'lessonsCellDescription':
      return l10n.lessonsCellDescription;
    case 'lessonsPlantDescription':
      return l10n.lessonsPlantDescription;
    case 'lessonsHeartDescription':
      return l10n.lessonsHeartDescription;

    // Cell parts
    case 'lessonsCellPartsNucleus':
      return l10n.lessonsCellPartsNucleus;
    case 'lessonsCellPartsNucleusDescription':
      return l10n.lessonsCellPartsNucleusDescription;
    case 'lessonsCellPartsMembrane':
      return l10n.lessonsCellPartsMembrane;
    case 'lessonsCellPartsMembraneDescription':
      return l10n.lessonsCellPartsMembraneDescription;
    case 'lessonsCellPartsMitochondria':
      return l10n.lessonsCellPartsMitochondria;
    case 'lessonsCellPartsMitochondriaDescription':
      return l10n.lessonsCellPartsMitochondriaDescription;
    case 'lessonsCellPartsCytoplasm':
      return l10n.lessonsCellPartsCytoplasm;
    case 'lessonsCellPartsCytoplasmDescription':
      return l10n.lessonsCellPartsCytoplasmDescription;

    default:
      return key;
  }
}
