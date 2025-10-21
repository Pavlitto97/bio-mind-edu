import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/rewards/data/models/reward_model.dart';

/// Provider to track newly unlocked achievements for display
class NewlyUnlockedAchievementsNotifier extends StateNotifier<List<Reward>> {
  NewlyUnlockedAchievementsNotifier() : super([]);

  /// Add newly unlocked achievements
  void addAchievements(List<Reward> achievements) {
    state = [...achievements];
  }

  /// Clear all achievements
  void clear() {
    state = [];
  }
}

/// Provider for newly unlocked achievements
final newlyUnlockedAchievementsProvider =
    StateNotifierProvider<NewlyUnlockedAchievementsNotifier, List<Reward>>(
      (ref) => NewlyUnlockedAchievementsNotifier(),
    );
