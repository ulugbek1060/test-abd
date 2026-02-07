import 'package:collection/collection.dart';

enum AccessType {
  public,
  unlisted,
  private;

  static AccessType fromString(String? name) {
    return AccessType.values.firstWhereOrNull((e) => e.name == name) ??
        AccessType.private;
  }
}
