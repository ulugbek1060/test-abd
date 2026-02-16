import 'package:flutter/material.dart';

class MyQuestionDetailScreen extends StatefulWidget {
  final int? questionId;

  const MyQuestionDetailScreen({super.key, this.questionId});

  @override
  State<MyQuestionDetailScreen> createState() => _MyQuestionDetailScreenState();
}

class _MyQuestionDetailScreenState extends State<MyQuestionDetailScreen> {
  int? selectedAnswer;

  final List<String> answers = [
    "Java is a compiled language",
    "Java supports multiple inheritance",
    "Java uses JVM",
    "Java does not support OOP",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Java Basics Test",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 2),
            Text(
              "Block 1: Introduction",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.lock_outline, size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _questionHeader(),
            const SizedBox(height: 20),
            _questionCard(),
            const SizedBox(height: 24),
            _answersSection(),
          ],
        ),
      ),
    );
  }

  Widget _questionHeader() {
    return Row(
      children: [
        // _chip("Easy", Colors.green),
        // const SizedBox(width: 8),
        _chip("Correct: 12", Colors.blue),
        const SizedBox(width: 8),
        _chip("Wrong: 3", Colors.red),
      ],
    );
  }

  Widget _questionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What is Java?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Choose the correct statements about Java programming language.",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _answersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Answers",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(answers.length, (index) => _answerTile(index)),
      ],
    );
  }

  Widget _answerTile(int index) {
    final bool isSelected = selectedAnswer == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.2)
              : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _answerLetter(index, isSelected),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                answers[index],
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerLetter(int index, bool selected) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.blue : Colors.grey.shade800,
      ),
      child: Text(
        String.fromCharCode(65 + index), // A, B, C, D
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
