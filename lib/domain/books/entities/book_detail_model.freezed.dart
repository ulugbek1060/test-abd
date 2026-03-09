// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookDetailModel {
  int? get id => throw _privateConstructorUsedError;
  AuthorModel? get author => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  String? get coverImage => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get pdfFile => throw _privateConstructorUsedError;
  String? get epubFile => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookDetailModelCopyWith<BookDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailModelCopyWith<$Res> {
  factory $BookDetailModelCopyWith(
          BookDetailModel value, $Res Function(BookDetailModel) then) =
      _$BookDetailModelCopyWithImpl<$Res, BookDetailModel>;
  @useResult
  $Res call(
      {int? id,
      AuthorModel? author,
      String? title,
      List<dynamic>? tags,
      String? coverImage,
      String? description,
      String? pdfFile,
      String? epubFile,
      int? totalPages,
      DateTime? createdAt});
}

/// @nodoc
class _$BookDetailModelCopyWithImpl<$Res, $Val extends BookDetailModel>
    implements $BookDetailModelCopyWith<$Res> {
  _$BookDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? tags = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? pdfFile = freezed,
    Object? epubFile = freezed,
    Object? totalPages = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorModel?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfFile: freezed == pdfFile
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as String?,
      epubFile: freezed == epubFile
          ? _value.epubFile
          : epubFile // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDetailModelImplCopyWith<$Res>
    implements $BookDetailModelCopyWith<$Res> {
  factory _$$BookDetailModelImplCopyWith(_$BookDetailModelImpl value,
          $Res Function(_$BookDetailModelImpl) then) =
      __$$BookDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      AuthorModel? author,
      String? title,
      List<dynamic>? tags,
      String? coverImage,
      String? description,
      String? pdfFile,
      String? epubFile,
      int? totalPages,
      DateTime? createdAt});
}

/// @nodoc
class __$$BookDetailModelImplCopyWithImpl<$Res>
    extends _$BookDetailModelCopyWithImpl<$Res, _$BookDetailModelImpl>
    implements _$$BookDetailModelImplCopyWith<$Res> {
  __$$BookDetailModelImplCopyWithImpl(
      _$BookDetailModelImpl _value, $Res Function(_$BookDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? title = freezed,
    Object? tags = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? pdfFile = freezed,
    Object? epubFile = freezed,
    Object? totalPages = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$BookDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as AuthorModel?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfFile: freezed == pdfFile
          ? _value.pdfFile
          : pdfFile // ignore: cast_nullable_to_non_nullable
              as String?,
      epubFile: freezed == epubFile
          ? _value.epubFile
          : epubFile // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$BookDetailModelImpl implements _BookDetailModel {
  const _$BookDetailModelImpl(
      {this.id,
      this.author,
      this.title,
      final List<dynamic>? tags,
      this.coverImage,
      this.description,
      this.pdfFile,
      this.epubFile,
      this.totalPages,
      this.createdAt})
      : _tags = tags;

  @override
  final int? id;
  @override
  final AuthorModel? author;
  @override
  final String? title;
  final List<dynamic>? _tags;
  @override
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? coverImage;
  @override
  final String? description;
  @override
  final String? pdfFile;
  @override
  final String? epubFile;
  @override
  final int? totalPages;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'BookDetailModel(id: $id, author: $author, title: $title, tags: $tags, coverImage: $coverImage, description: $description, pdfFile: $pdfFile, epubFile: $epubFile, totalPages: $totalPages, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile) &&
            (identical(other.epubFile, epubFile) ||
                other.epubFile == epubFile) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      title,
      const DeepCollectionEquality().hash(_tags),
      coverImage,
      description,
      pdfFile,
      epubFile,
      totalPages,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDetailModelImplCopyWith<_$BookDetailModelImpl> get copyWith =>
      __$$BookDetailModelImplCopyWithImpl<_$BookDetailModelImpl>(
          this, _$identity);
}

abstract class _BookDetailModel implements BookDetailModel {
  const factory _BookDetailModel(
      {final int? id,
      final AuthorModel? author,
      final String? title,
      final List<dynamic>? tags,
      final String? coverImage,
      final String? description,
      final String? pdfFile,
      final String? epubFile,
      final int? totalPages,
      final DateTime? createdAt}) = _$BookDetailModelImpl;

  @override
  int? get id;
  @override
  AuthorModel? get author;
  @override
  String? get title;
  @override
  List<dynamic>? get tags;
  @override
  String? get coverImage;
  @override
  String? get description;
  @override
  String? get pdfFile;
  @override
  String? get epubFile;
  @override
  int? get totalPages;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BookDetailModelImplCopyWith<_$BookDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
