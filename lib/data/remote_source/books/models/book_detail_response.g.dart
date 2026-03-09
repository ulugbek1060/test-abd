// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDetailResponseImpl _$$BookDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BookDetailResponseImpl(
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

Map<String, dynamic> _$$BookDetailResponseImplToJson(
        _$BookDetailResponseImpl instance) =>
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
