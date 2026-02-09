import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AccessType {
  public,
  unlisted,
  private;

  static AccessType fromString(String? name) {
    return AccessType.values.firstWhereOrNull((e) => e.name == name) ??
        AccessType.private;
  }
}

extension AccessTypeX on AccessType {
  IconData getIconData() {
    switch (this) {
      case AccessType.public:
        return Icons.public;
      case AccessType.unlisted:
        return Icons.lock_rounded;
      case AccessType.private:
        return Icons.lock_rounded;
    }
  }
}
