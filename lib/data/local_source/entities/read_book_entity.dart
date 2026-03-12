import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'read_book_entity.g.dart';

@HiveType(typeId: 6)
class ReadBookEntity extends Equatable {
  @HiveField(0)
  final int? bookId;

  @HiveField(1)
  final int? sessionId;

  @HiveField(2)
  final int? totalPages;

  @HiveField(3)
  final int? currentPage;

  @HiveField(4)
  final String? pdfPath;

  const ReadBookEntity({
    this.bookId,
    this.sessionId,
    this.totalPages,
    this.currentPage,
    this.pdfPath,
  });

  @override
  List<Object?> get props => [
    bookId,
    sessionId,
    totalPages,
    currentPage,
    pdfPath,
  ];

  ReadBookEntity copyWith({
    int? bookId,
    int? sessionId,
    int? totalPages,
    int? currentPage,
    String? pdfPath,
  }) {
    return ReadBookEntity(
      bookId: bookId ?? this.bookId,
      sessionId: bookId ?? this.sessionId,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      pdfPath: pdfPath ?? this.pdfPath,
    );
  }
}
