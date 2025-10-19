import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/ar_lesson/presentation/lessons_list_page.dart';

/// Main BioMindEDU application widget
class BioMindEduApp extends ConsumerWidget {
  const BioMindEduApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'BioMindEDU',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LessonsListPage(),
    );
  }
}
