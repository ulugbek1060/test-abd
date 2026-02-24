// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorsResponseImpl _$$AuthorsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthorsResponseImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AuthorsResponseImplToJson(
        _$AuthorsResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      bio: json['bio'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'bio': instance.bio,
      'image': instance.image,
    };
