import 'package:flutter/material.dart';
import '../../../shared/models/assessment.dart';

/// Results screen showing test performance and scores
class ResultsScreen extends StatefulWidget {
  final TestResult testResult;
  final AssessmentTest test;
  final VoidCallback onRetry;
  final VoidCallback onClose;

  const ResultsScreen({
    super.key,
    required this.testResult,
    required this.test,
    required this.onRetry,
    required this.onClose,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _getStars() {
    final score = widget.testResult.score;
    if (score >= 0.9) return 3;
    if (score >= 0.7) return 2;
    if (score >= 0.5) return 1;
    return 0;
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes}m ${remainingSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    final stars = _getStars();
    final percentage = (widget.testResult.score * 100).toInt();
    final isPassed = widget.testResult.isPassed;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: widget.onClose,
                    icon: const Icon(Icons.close),
                    iconSize: 32,
                  ),
                  Text(
                    'Test Results',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 48), // Balance the close button
                ],
              ),
            ),

            // Results card
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                        // Result icon and message
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Column(
                            children: [
                              // Icon
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: isPassed
                                      ? Colors.green[100]
                                      : Colors.orange[100],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isPassed
                                      ? Icons.celebration
                                      : Icons.sentiment_satisfied,
                                  size: 64,
                                  color: isPassed ? Colors.green : Colors.orange,
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Message
                              Text(
                                isPassed ? 'Great Job!' : 'Good Try!',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: isPassed ? Colors.green : Colors.orange,
                                    ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                isPassed
                                    ? 'You passed the test!'
                                    : 'Keep practicing and try again!',
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Stars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                index < stars ? Icons.star : Icons.star_border,
                                size: 56,
                                color: Colors.amber,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 32),

                        // Score card
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Percentage
                              Text(
                                '$percentage%',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                'Your Score',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              const Divider(height: 32),

                              // Statistics
                              _StatRow(
                                icon: Icons.check_circle,
                                label: 'Correct Answers',
                                value:
                                    '${widget.testResult.correctCount} / ${widget.testResult.totalCount}',
                                color: Colors.green,
                              ),

                              const SizedBox(height: 16),

                              _StatRow(
                                icon: Icons.timer,
                                label: 'Time Taken',
                                value: _formatTime(
                                    widget.testResult.timeTakenSeconds),
                                color: Colors.blue,
                              ),

                              const SizedBox(height: 16),

                              _StatRow(
                                icon: Icons.emoji_events,
                                label: 'Stars Earned',
                                value: '$stars / 3',
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Reward message (if passed)
                        if (isPassed && widget.test.rewardId != null) ...[
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purple[100]!,
                                  Colors.pink[100]!,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.card_giftcard,
                                  size: 48,
                                  color: Colors.purple,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reward Unlocked!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Check your rewards collection',
                                        style:
                                            Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  ),
                ),

                // Action buttons
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        onPressed: widget.onClose,
                        icon: const Icon(Icons.home),
                        label: const Text('Back to Lessons'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      OutlinedButton.icon(
                        onPressed: widget.onRetry,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Try Again'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

/// Statistic row widget
class _StatRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }
}
