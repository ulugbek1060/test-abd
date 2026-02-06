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
