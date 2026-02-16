import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatelessWidget {
  final int? questionId;

  const QuestionDetailScreen({super.key, this.questionId});

  @override
  Widget build(BuildContext context) {
    return _View();
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question Detail'), centerTitle: true),

      body: const Center(child: Text('Question Detail Screen')),
    );
  }
}
