import 'package:flutter/material.dart';


// ---------------- SUPPORTING WIDGETS ----------------
enum Difficulty { easy, medium, hard }

extension QuestionDifficultyColorX on Difficulty {
  Color get color {
    switch (this) {
      case Difficulty.easy:
        return Colors.green;
      case Difficulty.medium:
        return const Color(0xFFFFCA28);

      case Difficulty.hard:
        return Colors.red;
    }
  }
}

extension QuestionDifficultyFromDouble on double? {
  Difficulty toDifficulty() {
    if (this == null) {
      return Difficulty.easy;
    }
    final value = this!.clamp(0.0, 1.0);

    if (value >= 0.7) {
      return Difficulty.easy;
    } else if (value >= 0.4) {
      return Difficulty.medium;
    } else {
      return Difficulty.hard;
    }
  }
}
