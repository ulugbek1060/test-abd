// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_sessions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReadingSessionsResponseImpl _$$ReadingSessionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingSessionsResponseImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReadingSessionsResponseImplToJson(
        _$ReadingSessionsResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: (json['id'] as num?)?.toInt(),
      book: json['book'] == null
          ? null
          : Book.fromJson(json['book'] as Map<String, dynamic>),
      mode: json['mode'] as String?,
      status: json['status'] as String?,
      targetPage: (json['target_page'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book': instance.book,
      'mode': instance.mode,
      'status': instance.status,
      'target_page': instance.targetPage,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: (json['id'] as num?)?.toInt(),
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      tags: json['tags'] as List<dynamic>?,
      title: json['title'] as String?,
      coverImage: json['cover_image'] as String?,
      description: json['description'] as String?,
      pdfFile: json['pdf_file'] as String?,
      epubFile: json['epub_file'] as String?,
      totalPages: (json['total_pages'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'tags': instance.tags,
      'title': instance.title,
      'cover_image': instance.coverImage,
      'description': instance.description,
      'pdf_file': instance.pdfFile,
      'epub_file': instance.epubFile,
      'total_pages': instance.totalPages,
      'created_at': instance.createdAt?.toIso8601String(),
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
