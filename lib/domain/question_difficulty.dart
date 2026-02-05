
import 'dart:ui';


// ---------------- SUPPORTING WIDGETS ----------------
enum QuestionDifficulty { easy, medium, hard }

extension QuestionDifficultyColorX on QuestionDifficulty {
  Color get color {
    switch (this) {
      case QuestionDifficulty.easy:
        return const Color(0xFF66BB6A);

      case QuestionDifficulty.medium:
        return const Color(0xFFFFCA28);

      case QuestionDifficulty.hard:
        return const Color(0xFFEF5350);
    }
  }
}

extension QuestionDifficultyFromDouble on double? {
  QuestionDifficulty toDifficulty() {
    if (this == null) {
      return QuestionDifficulty.easy;
    }
    final value = this!.clamp(0.0, 1.0);

    if (value >= 0.7) {
      return QuestionDifficulty.easy;
    } else if (value >= 0.4) {
      return QuestionDifficulty.medium;
    } else {
      return QuestionDifficulty.hard;
    }
  }
}
