import 'package:flutter/cupertino.dart';
import 'package:testabd/l10n/l10n_extension.dart';

enum KnowledgeLevel {
  beginner,
  intermediate,
  advanced,
  expert,
  none;

  static KnowledgeLevel tryParse(String? level) {
    switch (level) {
      case 'beginner':
        return KnowledgeLevel.beginner;
      case 'intermediate':
        return KnowledgeLevel.intermediate;
      case 'advanced':
        return KnowledgeLevel.advanced;
      case 'expert':
        return KnowledgeLevel.expert;
      default:
        return KnowledgeLevel.none;
    }
  }
}

extension KnowledgeLevelExtension on KnowledgeLevel {
  String getText(BuildContext context) {
    switch (this) {
      case KnowledgeLevel.beginner:
        return context.l10n.knowledge_level_beginner;
      case KnowledgeLevel.intermediate:
        return context.l10n.knowledge_level_intermediate;
      case KnowledgeLevel.advanced:
        return context.l10n.knowledge_level_advanced;
      case KnowledgeLevel.expert:
        return context.l10n.knowledge_level_expert;
      case KnowledgeLevel.none:
        return context.l10n.knowledge_level_none;
    }
  }

  String knowledgeLevelToString() {
    switch (this) {
      case KnowledgeLevel.beginner:
        return 'beginner';
      case KnowledgeLevel.intermediate:
        return 'intermediate';
      case KnowledgeLevel.advanced:
        return 'advanced';
      case KnowledgeLevel.expert:
        return 'expert';
      default:
        return 'none';
    }
  }
}
