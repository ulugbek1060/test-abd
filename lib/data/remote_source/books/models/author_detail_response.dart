
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_detail_response.freezed.dart';
part 'author_detail_response.g.dart';

@freezed
class AuthorDetailResponse with _$AuthorDetailResponse {
  const factory AuthorDetailResponse({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'bio') String? bio,
    @JsonKey(name: 'image') String? image,
  }) = _AuthorDetailResponse;

  factory AuthorDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailResponseFromJson(json);
}