import 'package:freezed_annotation/freezed_annotation.dart';

part 'authors_response.freezed.dart';

part 'authors_response.g.dart';

@freezed
class AuthorsResponse with _$AuthorsResponse {
  const factory AuthorsResponse({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @Default([]) @JsonKey(name: 'results') List<Author> results,
  }) = _AuthorsResponse;

  factory AuthorsResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorsResponseFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'bio') String? bio,
    @JsonKey(name: 'image') String? image,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
