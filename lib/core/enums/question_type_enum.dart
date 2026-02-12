import 'package:flutter/src/widgets/framework.dart';
import 'package:testabd/l10n/l10n_extension.dart';

enum QuestionType {
  singleSelect,
  multipleSelect,
  trueFalse,
  textQuestion;

  static String fromEnum(QuestionType type) {
    switch (type) {
      case QuestionType.singleSelect:
        return "single";
      case QuestionType.multipleSelect:
        return "multiple";
      case QuestionType.trueFalse:
        return "true_false";
      case QuestionType.textQuestion:
        return "text";
    }
  }

  static QuestionType? fromString(String? questionType) {
    switch (questionType) {
      case "single":
        return QuestionType.singleSelect;
      case "multiple":
        return QuestionType.multipleSelect;
      case "true_false":
        return QuestionType.trueFalse;
      case "text":
        return QuestionType.textQuestion;
      default:
        return null;
    }
  }
}

extension QuestionTypeEnumX on QuestionType {
  String getName(BuildContext context) {
    switch (this) {
      case QuestionType.singleSelect:
        return context.l10n.singleSelect;
      case QuestionType.multipleSelect:
        return context.l10n.multipleSelect;
      case QuestionType.trueFalse:
        return context.l10n.trueFalse;
      case QuestionType.textQuestion:
        return context.l10n.textQuestion;
    }
  }
}
