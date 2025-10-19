import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../data/models/reward_model.dart';

/// Celebration widget displayed when a reward is unlocked
class RewardUnlockCelebration extends StatefulWidget {
  final Reward reward;
  final VoidCallback? onComplete;

  const RewardUnlockCelebration({
    super.key,
    required this.reward,
    this.onComplete,
  });

  @override
  State<RewardUnlockCelebration> createState() =>
      _RewardUnlockCelebrationState();
}

class _RewardUnlockCelebrationState extends State<RewardUnlockCelebration>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _particleController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Scale animation for the reward icon
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    // Rotation animation
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    // Particle animation
    _particleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _scaleController.forward();
    _rotationController.forward();
    _particleController.forward();

    // Auto-dismiss after animations complete
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      widget.onComplete?.call();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated particles
            SizedBox(
              width: 300,
              height: 300,
              child: AnimatedBuilder(
                animation: _particleController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _ParticlePainter(
                      animation: _particleController.value,
                    ),
                  );
                },
              ),
            ),

            // Reward icon with scale and rotation
            Transform.translate(
              offset: const Offset(0, -150),
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: RotationTransition(
                  turns: _rotationAnimation,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _getCategoryColor().withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      _getRewardIcon(),
                      size: 60,
                      color: _getCategoryColor(),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Reward name
            FadeTransition(
              opacity: _scaleAnimation,
              child: Text(
                'Reward Unlocked!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            FadeTransition(
              opacity: _scaleAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.reward.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 8),

            FadeTransition(
              opacity: _scaleAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  widget.reward.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getRewardIcon() {
    switch (widget.reward.category) {
      case RewardCategory.badge:
        return Icons.military_tech;
      case RewardCategory.sticker:
        return Icons.star;
      case RewardCategory.achievement:
        return Icons.emoji_events;
      case RewardCategory.trophy:
        return Icons.emoji_events_outlined;
    }
  }

  Color _getCategoryColor() {
    switch (widget.reward.category) {
      case RewardCategory.badge:
        return Colors.blue;
      case RewardCategory.sticker:
        return Colors.amber;
      case RewardCategory.achievement:
        return Colors.purple;
      case RewardCategory.trophy:
        return Colors.orange;
    }
  }
}

/// Custom painter for particle effects
class _ParticlePainter extends CustomPainter {
  final double animation;

  _ParticlePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final particleCount = 20;

    for (var i = 0; i < particleCount; i++) {
      final angle = (2 * math.pi / particleCount) * i;
      final distance = animation * 100;

      final x = center.dx + math.cos(angle) * distance;
      final y = center.dy + math.sin(angle) * distance;

      // Fade out particles as they move away
      final opacity = 1.0 - animation;
      paint.color = _getParticleColor(i).withOpacity(opacity);

      // Draw particle
      canvas.drawCircle(Offset(x, y), 4 * (1 - animation * 0.5), paint);
    }
  }

  Color _getParticleColor(int index) {
    final colors = [
      Colors.amber,
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.green,
    ];
    return colors[index % colors.length];
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

/// Show reward unlock celebration as an overlay
void showRewardUnlockCelebration(BuildContext context, Reward reward) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) => RewardUnlockCelebration(
      reward: reward,
      onComplete: () => Navigator.of(context).pop(),
    ),
  );
}
