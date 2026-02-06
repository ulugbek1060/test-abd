import 'package:equatable/equatable.dart';

class AnswerItemModel extends Equatable {
  final int? id;
  final String? letter;
  final String? answerText;
  final bool isCorrect;
  final bool isLoading;

  const AnswerItemModel({
    this.id,
    this.letter,
    this.answerText,
    this.isCorrect = false,
    this.isLoading = false,
  });

  AnswerItemModel copyWith({
    int? id,
    String? letter,
    String? answerText,
    bool? isCorrect,
    bool? isLoading,
  }) {
    return AnswerItemModel(
      id: id ?? this.id,
      letter: letter ?? this.letter,
      answerText: answerText ?? this.answerText,
      isCorrect: isCorrect ?? this.isCorrect,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "letter": letter,
      "answer_text": answerText,
      "is_correct": isCorrect,
    };
  }

  @override
  List<Object?> get props => [id, letter, answerText, isCorrect, isLoading];
}
