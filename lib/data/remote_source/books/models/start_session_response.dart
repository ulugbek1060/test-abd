import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_session_response.freezed.dart';
part 'start_session_response.g.dart';

@freezed
class StartSessionResponse with _$StartSessionResponse {
  const factory StartSessionResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'book') Book? book,
    @JsonKey(name: 'mode') String? mode,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'target_page') int? targetPage,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _StartSessionResponse;

  factory StartSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSessionResponseFromJson(json);
}

@freezed
class Book with _$Book {
  const factory Book({
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
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) =>
      _$BookFromJson(json);
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
