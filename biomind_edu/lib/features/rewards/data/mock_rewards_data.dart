import '../data/models/reward_model.dart';

/// Mock reward data for the MVP
final List<Reward> mockRewards = [
  // Cell lesson rewards
  const Reward(
    id: 'reward_cell_explorer',
    name: 'Cell Explorer',
    description: 'Completed the Cell lesson!',
    imageUrl: 'assets/images/rewards/cell_badge.png',
    category: RewardCategory.badge,
  ),
  const Reward(
    id: 'reward_cell_master',
    name: 'Cell Master',
    description: 'Scored 100% on Cell test!',
    imageUrl: 'assets/images/rewards/cell_trophy.png',
    category: RewardCategory.trophy,
  ),
  
  // Plant lesson rewards
  const Reward(
    id: 'reward_plant_friend',
    name: 'Plant Friend',
    description: 'Completed the Plant lesson!',
    imageUrl: 'assets/images/rewards/plant_badge.png',
    category: RewardCategory.badge,
  ),
  const Reward(
    id: 'reward_photosynthesis_pro',
    name: 'Photosynthesis Pro',
    description: 'Mastered photosynthesis!',
    imageUrl: 'assets/images/rewards/plant_sticker.png',
    category: RewardCategory.sticker,
  ),
  
  // Heart lesson rewards
  const Reward(
    id: 'reward_heart_hero',
    name: 'Heart Hero',
    description: 'Completed the Heart lesson!',
    imageUrl: 'assets/images/rewards/heart_badge.png',
    category: RewardCategory.badge,
  ),
  const Reward(
    id: 'reward_circulation_star',
    name: 'Circulation Star',
    description: 'Perfect score on Heart test!',
    imageUrl: 'assets/images/rewards/heart_trophy.png',
    category: RewardCategory.trophy,
  ),
  
  // Achievement rewards
  const Reward(
    id: 'reward_first_steps',
    name: 'First Steps',
    description: 'Started your learning journey!',
    imageUrl: 'assets/images/rewards/first_steps.png',
    category: RewardCategory.achievement,
  ),
  const Reward(
    id: 'reward_quick_learner',
    name: 'Quick Learner',
    description: 'Completed 3 lessons in a row!',
    imageUrl: 'assets/images/rewards/quick_learner.png',
    category: RewardCategory.achievement,
  ),
  const Reward(
    id: 'reward_scientist',
    name: 'Young Scientist',
    description: 'Unlocked all biology badges!',
    imageUrl: 'assets/images/rewards/scientist.png',
    category: RewardCategory.achievement,
  ),
  const Reward(
    id: 'reward_perfect_score',
    name: 'Perfect Score',
    description: 'Got 100% on any test!',
    imageUrl: 'assets/images/rewards/perfect_score.png',
    category: RewardCategory.sticker,
  ),
];

/// Get reward by lesson ID
Reward? getRewardByLessonId(String lessonId) {
  switch (lessonId) {
    case 'cell':
      return mockRewards[0]; // Cell Explorer badge
    case 'plant':
      return mockRewards[2]; // Plant Friend badge
    case 'heart':
      return mockRewards[4]; // Heart Hero badge
    default:
      return null;
  }
}

/// Get reward for perfect score on lesson
Reward? getPerfectScoreReward(String lessonId) {
  switch (lessonId) {
    case 'cell':
      return mockRewards[1]; // Cell Master trophy
    case 'plant':
      return mockRewards[3]; // Photosynthesis Pro sticker
    case 'heart':
      return mockRewards[5]; // Circulation Star trophy
    default:
      return null;
  }
}
