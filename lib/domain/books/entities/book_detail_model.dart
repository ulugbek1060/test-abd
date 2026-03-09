import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/data/remote_source/books/models/book_detail_response.dart';
import 'package:testabd/domain/books/entities/author_model.dart';

part 'book_detail_model.freezed.dart';

@freezed
class BookDetailModel with _$BookDetailModel {
  const factory BookDetailModel({
    int? id,
    AuthorModel? author,
    String? title,
    List<dynamic>? tags,
    String? coverImage,
    String? description,
    String? pdfFile,
    String? epubFile,
    int? totalPages,
    DateTime? createdAt,
  }) = _BookDetailModel;

  static BookDetailModel fromResponse(BookDetailResponse response) {
    return BookDetailModel(
      id: response.id,
      author: AuthorModel(
        id: response.author?.id,
        fullName: response.author?.fullName,
        bio: response.author?.bio,
        image: response.author?.image,
      ),
      title: response.title,
      tags: response.tags,
      coverImage: response.coverImage,
      description: response.description,
      pdfFile: response.pdfFile,
      epubFile: response.epubFile,
      totalPages: response.totalPages,
      createdAt: response.createdAt,
    );
  }
}