// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorDetailResponseImpl _$$AuthorDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthorDetailResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      bio: json['bio'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$AuthorDetailResponseImplToJson(
        _$AuthorDetailResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'bio': instance.bio,
      'image': instance.image,
    };
