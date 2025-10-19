import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/assessment.dart';
import '../widgets/question_card.dart';
import '../widgets/results_screen.dart';

/// Assessment test page with questions and results
class AssessmentPage extends ConsumerStatefulWidget {
  final String testId;
  final String lessonId;

  const AssessmentPage({
    super.key,
    required this.testId,
    required this.lessonId,
  });

  @override
  ConsumerState<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends ConsumerState<AssessmentPage> {
  late AssessmentTest _test;
  int _currentQuestionIndex = 0;
  Map<String, List<String>> _userAnswers = {};
  Timer? _timer;
  int _elapsedSeconds = 0;
  bool _showResults = false;
  late TestResult _testResult;

  @override
  void initState() {
    super.initState();
    _test = _createMockTest();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });

      // Check time limit if set
      if (_test.timeLimitSeconds != null &&
          _elapsedSeconds >= _test.timeLimitSeconds!) {
        _finishTest();
      }
    });
  }

  void _handleAnswer(String questionId, List<String> answerIds) {
    setState(() {
      _userAnswers[questionId] = answerIds;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _test.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _finishTest();
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _finishTest() {
    _timer?.cancel();

    // Calculate results
    int correctCount = 0;
    int totalPoints = 0;
    int earnedPoints = 0;
    List<QuestionResult> questionResults = [];

    for (final question in _test.questions) {
      final userAnswer = _userAnswers[question.id] ?? [];
      final correctAnswer = question.correctAnswerIds;
      
      // Check if answer is correct
      final isCorrect = _listsEqual(userAnswer, correctAnswer);
      if (isCorrect) {
        correctCount++;
        earnedPoints += question.points;
      }
      totalPoints += question.points;

      questionResults.add(QuestionResult(
        questionId: question.id,
        userAnswerIds: userAnswer,
        correctAnswerIds: correctAnswer,
        isCorrect: isCorrect,
        pointsEarned: isCorrect ? question.points : 0,
      ));
    }

    final score = totalPoints > 0 ? earnedPoints / totalPoints : 0.0;
    final isPassed = score >= _test.passingScore;

    _testResult = TestResult(
      testId: _test.id,
      userAnswers: _userAnswers,
      correctCount: correctCount,
      totalCount: _test.questions.length,
      score: score,
      isPassed: isPassed,
      timeTakenSeconds: _elapsedSeconds,
      completedAt: DateTime.now(),
      questionResults: questionResults,
    );

    setState(() {
      _showResults = true;
    });
  }

  bool _listsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    final sortedA = List<String>.from(a)..sort();
    final sortedB = List<String>.from(b)..sort();
    for (int i = 0; i < sortedA.length; i++) {
      if (sortedA[i] != sortedB[i]) return false;
    }
    return true;
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  AssessmentTest _createMockTest() {
    return AssessmentTest(
      id: widget.testId,
      titleKey: 'Cell Knowledge Test',
      passingScore: 0.8,
      timeLimitSeconds: null, // No time limit for children
      rewardId: 'cell_master_badge',
      questions: [
        Question(
          id: 'q1',
          questionKey: 'What is the powerhouse of the cell?',
          type: QuestionType.multipleChoice,
          correctAnswerIds: ['mitochondria'],
          points: 1,
          options: [
            AnswerOption(
              id: 'nucleus',
              textKey: 'Nucleus',
              iconName: 'science',
            ),
            AnswerOption(
              id: 'mitochondria',
              textKey: 'Mitochondria',
              iconName: 'flash_on',
            ),
            AnswerOption(
              id: 'ribosome',
              textKey: 'Ribosome',
              iconName: 'bubble_chart',
            ),
            AnswerOption(
              id: 'golgi',
              textKey: 'Golgi Apparatus',
              iconName: 'layers',
            ),
          ],
        ),
        Question(
          id: 'q2',
          questionKey: 'Which part controls what enters and leaves the cell?',
          type: QuestionType.multipleChoice,
          correctAnswerIds: ['membrane'],
          points: 1,
          options: [
            AnswerOption(
              id: 'membrane',
              textKey: 'Cell Membrane',
              iconName: 'circle',
            ),
            AnswerOption(
              id: 'wall',
              textKey: 'Cell Wall',
              iconName: 'square',
            ),
            AnswerOption(
              id: 'cytoplasm',
              textKey: 'Cytoplasm',
              iconName: 'water',
            ),
            AnswerOption(
              id: 'vacuole',
              textKey: 'Vacuole',
              iconName: 'water_drop',
            ),
          ],
        ),
        Question(
          id: 'q3',
          questionKey: 'What contains the cell\'s genetic information?',
          type: QuestionType.multipleChoice,
          correctAnswerIds: ['nucleus'],
          points: 1,
          options: [
            AnswerOption(
              id: 'nucleus',
              textKey: 'Nucleus',
              iconName: 'account_circle',
            ),
            AnswerOption(
              id: 'mitochondria',
              textKey: 'Mitochondria',
              iconName: 'flash_on',
            ),
            AnswerOption(
              id: 'chloroplast',
              textKey: 'Chloroplast',
              iconName: 'eco',
            ),
            AnswerOption(
              id: 'ribosome',
              textKey: 'Ribosome',
              iconName: 'bubble_chart',
            ),
          ],
        ),
        Question(
          id: 'q4',
          questionKey: 'Where does photosynthesis happen in plant cells?',
          type: QuestionType.multipleChoice,
          correctAnswerIds: ['chloroplast'],
          points: 1,
          options: [
            AnswerOption(
              id: 'mitochondria',
              textKey: 'Mitochondria',
              iconName: 'flash_on',
            ),
            AnswerOption(
              id: 'chloroplast',
              textKey: 'Chloroplast',
              iconName: 'eco',
            ),
            AnswerOption(
              id: 'vacuole',
              textKey: 'Vacuole',
              iconName: 'water_drop',
            ),
            AnswerOption(
              id: 'nucleus',
              textKey: 'Nucleus',
              iconName: 'account_circle',
            ),
          ],
        ),
        Question(
          id: 'q5',
          questionKey: 'What makes proteins in the cell?',
          type: QuestionType.multipleChoice,
          correctAnswerIds: ['ribosome'],
          points: 1,
          options: [
            AnswerOption(
              id: 'nucleus',
              textKey: 'Nucleus',
              iconName: 'account_circle',
            ),
            AnswerOption(
              id: 'ribosome',
              textKey: 'Ribosome',
              iconName: 'bubble_chart',
            ),
            AnswerOption(
              id: 'golgi',
              textKey: 'Golgi Apparatus',
              iconName: 'layers',
            ),
            AnswerOption(
              id: 'lysosome',
              textKey: 'Lysosome',
              iconName: 'delete',
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showResults) {
      return ResultsScreen(
        testResult: _testResult,
        test: _test,
        onRetry: () {
          setState(() {
            _currentQuestionIndex = 0;
            _userAnswers = {};
            _elapsedSeconds = 0;
            _showResults = false;
          });
          _startTimer();
        },
        onClose: () {
          Navigator.of(context).pop();
        },
      );
    }

    final currentQuestion = _test.questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _test.questions.length;
    final hasAnswer = _userAnswers.containsKey(currentQuestion.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_test.titleKey),
        centerTitle: true,
        actions: [
          // Timer display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                children: [
                  const Icon(Icons.timer, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    _formatTime(_elapsedSeconds),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),

          // Question counter
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Question ${_currentQuestionIndex + 1} of ${_test.questions.length}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ),

          // Question card
          Expanded(
            child: QuestionCard(
              question: currentQuestion,
              selectedAnswerIds: _userAnswers[currentQuestion.id] ?? [],
              onAnswerSelected: (answerIds) {
                _handleAnswer(currentQuestion.id, answerIds);
              },
            ),
          ),

          // Navigation buttons
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
            child: Row(
              children: [
                // Previous button
                if (_currentQuestionIndex > 0)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _previousQuestion,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                if (_currentQuestionIndex > 0) const SizedBox(width: 16),

                // Next/Finish button
                Expanded(
                  flex: _currentQuestionIndex > 0 ? 1 : 1,
                  child: ElevatedButton.icon(
                    onPressed: hasAnswer ? _nextQuestion : null,
                    icon: Icon(
                      _currentQuestionIndex < _test.questions.length - 1
                          ? Icons.arrow_forward
                          : Icons.check,
                    ),
                    label: Text(
                      _currentQuestionIndex < _test.questions.length - 1
                          ? 'Next'
                          : 'Finish Test',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: hasAnswer
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
