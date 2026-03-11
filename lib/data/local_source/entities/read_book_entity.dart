import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'read_book_entity.g.dart';

@HiveType(typeId: 6)
class ReadBookEntity extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? totalPages;

  @HiveField(2)
  final int? currentPage;

  @HiveField(3)
  final String? pdfPath;

  ReadBookEntity({this.id, this.totalPages, this.currentPage, this.pdfPath});

  @override
  List<Object?> get props => [id, totalPages, currentPage, pdfPath];

  ReadBookEntity copyWith({
    int? id,
    int? totalPages,
    int? currentPage,
    String? pdfPath,
  }) {
    return ReadBookEntity(
      id: id ?? this.id,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      pdfPath: pdfPath ?? this.pdfPath,
    );
  }
}