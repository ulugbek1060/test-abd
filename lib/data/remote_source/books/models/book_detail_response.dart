
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_detail_response.freezed.dart';
part 'book_detail_response.g.dart';

@freezed
class BookDetailResponse with _$BookDetailResponse {
  const factory BookDetailResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'author') Author? author,
    @JsonKey(name: 'tags') List<dynamic>? tags,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'pdf_file') String? pdfFile,
    @JsonKey(name: 'epub_file') String? epubFile,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _BookDetailResponse;

  factory BookDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDetailResponseFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'bio') String? bio,
    @JsonKey(name: 'image') String? image,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) =>
      _$AuthorFromJson(json);
}