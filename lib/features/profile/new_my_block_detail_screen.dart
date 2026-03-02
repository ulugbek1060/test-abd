import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizly - Instagram Style',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'San Francisco',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE1306C),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),

      ),
      home:  QuestionListScreen(),
    );
  }
}

class Question {
  final String text;
  final String difficulty;
  final int correctCount;
  final int wrongCount;
  final List<String> options;
  final String createdAt;

  Question({
    required this.text,
    required this.difficulty,
    required this.correctCount,
    required this.wrongCount,
    required this.options,
    required this.createdAt,
  });
}

class QuestionListScreen extends StatelessWidget {
   QuestionListScreen({super.key});

  final String quizTitle = "Ultimate Math Challenge";
  final String category = "Mathematics";           // ← NEW: Block category
  final String visibility = "Public";              // ← NEW: Private or Public
  final String quizDescription =
      "Master algebra, geometry & calculus with 25 handpicked questions. Perfect for students & enthusiasts.";

  final List<Question> questions = [
    Question(
      text: "What is the value of 2 + 2 × 3?",
      difficulty: "Easy",
      correctCount: 1842,
      wrongCount: 158,
      options: ["6", "8", "10", "12"],
      createdAt: "2 hours ago",
    ),
    Question(
      text: "Solve for x: x² = 16",
      difficulty: "Medium",
      correctCount: 1320,
      wrongCount: 680,
      options: ["x = 4", "x = -4", "x = ±4", "x = 2"],
      createdAt: "Yesterday",
    ),
    Question(
      text: "What is the derivative of sin(x)?",
      difficulty: "Hard",
      correctCount: 945,
      wrongCount: 1055,
      options: ["cos(x)", "-cos(x)", "sin(x)", "tan(x)"],
      createdAt: "Mar 1, 2026",
    ),
    Question(
      text: "If a triangle has sides 3, 4, 5, what is its area?",
      difficulty: "Medium",
      correctCount: 1678,
      wrongCount: 322,
      options: ["6", "7.5", "10", "12"],
      createdAt: "Feb 28, 2026",
    ),
  ];

  final int totalParticipants = 12456;
  final double avgSolveRate = 68.4;

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPublic = visibility.toLowerCase() == "public";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Questions",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Instagram-style gradient header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE1306C),
                  Color(0xFF405DE6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ← NEW: Category + Visibility row (above description)
                Row(
                  children: [
                    // Category block
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.category_rounded, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Visibility badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isPublic ? Icons.public : Icons.lock,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            visibility,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Title
                Text(
                  quizTitle,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  quizDescription,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // Stats row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            child: Row(
              children: [
                _buildStatCard(
                  icon: Icons.quiz_outlined,
                  value: questions.length.toString(),
                  label: "Questions",
                  color: const Color(0xFF405DE6),
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  icon: Icons.people_alt_outlined,
                  value: totalParticipants.toString(),
                  label: "Participants",
                  color: Colors.green,
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  icon: Icons.emoji_events_outlined,
                  value: "${avgSolveRate.toStringAsFixed(1)}%",
                  label: "Avg Solve",
                  color: Colors.orange,
                ),
              ],
            ),
          ),

          // Questions list header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Questions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "${questions.length} total",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Big question cards list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                final diffColor = _getDifficultyColor(q.difficulty);

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: Difficulty + Solved counts
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: diffColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                q.difficulty.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: diffColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  "${q.correctCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(Icons.cancel, color: Colors.redAccent, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  "${q.wrongCount}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Question text
                        Text(
                          q.text,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Options
                        const Text(
                          "Options",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...q.options.asMap().entries.map((entry) {
                          final idx = entry.key;
                          final option = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${String.fromCharCode(65 + idx)}.",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),

                        const SizedBox(height: 20),

                        // Created time
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Created ${q.createdAt}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[500],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Starting quiz... 🚀")),
          );
        },
        label: const Text("Start Quiz"),
        icon: const Icon(Icons.play_arrow),
        backgroundColor: const Color(0xFFE1306C),
      ),
    );
  }
}