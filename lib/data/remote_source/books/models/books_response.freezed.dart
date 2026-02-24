// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BooksResponse _$BooksResponseFromJson(Map<String, dynamic> json) {
  return _BooksResponse.fromJson(json);
}

/// @nodoc
mixin _$BooksResponse {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<Book> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BooksResponseCopyWith<BooksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksResponseCopyWith<$Res> {
  factory $BooksResponseCopyWith(
          BooksResponse value, $Res Function(BooksResponse) then) =
      _$BooksResponseCopyWithImpl<$Res, BooksResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<Book> results});
}

/// @nodoc
class _$BooksResponseCopyWithImpl<$Res, $Val extends BooksResponse>
    implements $BooksResponseCopyWith<$Res> {
  _$BooksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksResponseImplCopyWith<$Res>
    implements $BooksResponseCopyWith<$Res> {
  factory _$$BooksResponseImplCopyWith(
          _$BooksResponseImpl value, $Res Function(_$BooksResponseImpl) then) =
      __$$BooksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<Book> results});
}

/// @nodoc
class __$$BooksResponseImplCopyWithImpl<$Res>
    extends _$BooksResponseCopyWithImpl<$Res, _$BooksResponseImpl>
    implements _$$BooksResponseImplCopyWith<$Res> {
  __$$BooksResponseImplCopyWithImpl(
      _$BooksResponseImpl _value, $Res Function(_$BooksResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$BooksResponseImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Book>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooksResponseImpl implements _BooksResponse {
  const _$BooksResponseImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'next') this.next,
      @JsonKey(name: 'previous') this.previous,
      @JsonKey(name: 'results') final List<Book> results = const []})
      : _results = results;

  factory _$BooksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooksResponseImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'next')
  final String? next;
  @override
  @JsonKey(name: 'previous')
  final String? previous;
  final List<Book> _results;
  @override
  @JsonKey(name: 'results')
  List<Book> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'BooksResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksResponseImplCopyWith<_$BooksResponseImpl> get copyWith =>
      __$$BooksResponseImplCopyWithImpl<_$BooksResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BooksResponseImplToJson(
      this,
    );
  }
}

abstract class _BooksResponse implements BooksResponse {
  const factory _BooksResponse(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'next') final String? next,
          @JsonKey(name: 'previous') final String? previous,
          @JsonKey(name: 'results') final List<Book> results}) =
      _$BooksResponseImpl;

  factory _BooksResponse.fromJson(Map<String, dynamic> json) =
      _$BooksResponseImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'previous')
  String? get previous;
  @override
  @JsonKey(name: 'results')
  List<Book> get results;
  @override
  @JsonKey(ignore: true)
  _$$BooksResponseImplCopyWith<_$BooksResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  Author? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<dynamic> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_file')
  String? get pdfFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'epub_file')
  String? get epubFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'tags') List<dynamic> tags,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'pdf_file') String? pdfFile,
      @JsonKey(name: 'epub_file') String? epubFile,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $AuthorCopyWith<$Res>? get author;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? tags = null,
    Object? title = freezed,
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
              as Author?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $AuthorCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'author') Author? author,
      @JsonKey(name: 'tags') List<dynamic> tags,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'pdf_file') String? pdfFile,
      @JsonKey(name: 'epub_file') String? epubFile,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $AuthorCopyWith<$Res>? get author;
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? tags = null,
    Object? title = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? pdfFile = freezed,
    Object? epubFile = freezed,
    Object? totalPages = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$BookImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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
@JsonSerializable()
class _$BookImpl implements _Book {
  const _$BookImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'tags') final List<dynamic> tags = const [],
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'cover_image') this.coverImage,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'pdf_file') this.pdfFile,
      @JsonKey(name: 'epub_file') this.epubFile,
      @JsonKey(name: 'total_pages') this.totalPages,
      @JsonKey(name: 'created_at') this.createdAt})
      : _tags = tags;

  factory _$BookImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'author')
  final Author? author;
  final List<dynamic> _tags;
  @override
  @JsonKey(name: 'tags')
  List<dynamic> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'pdf_file')
  final String? pdfFile;
  @override
  @JsonKey(name: 'epub_file')
  final String? epubFile;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Book(id: $id, author: $author, tags: $tags, title: $title, coverImage: $coverImage, description: $description, pdfFile: $pdfFile, epubFile: $epubFile, totalPages: $totalPages, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.title, title) || other.title == title) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      const DeepCollectionEquality().hash(_tags),
      title,
      coverImage,
      description,
      pdfFile,
      epubFile,
      totalPages,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookImplToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'author') final Author? author,
      @JsonKey(name: 'tags') final List<dynamic> tags,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'cover_image') final String? coverImage,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'pdf_file') final String? pdfFile,
      @JsonKey(name: 'epub_file') final String? epubFile,
      @JsonKey(name: 'total_pages') final int? totalPages,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$BookImpl;

  factory _Book.fromJson(Map<String, dynamic> json) = _$BookImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'author')
  Author? get author;
  @override
  @JsonKey(name: 'tags')
  List<dynamic> get tags;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'pdf_file')
  String? get pdfFile;
  @override
  @JsonKey(name: 'epub_file')
  String? get epubFile;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bio')
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
          _$AuthorImpl value, $Res Function(_$AuthorImpl) then) =
      __$$AuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'image') String? image});
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
      _$AuthorImpl _value, $Res Function(_$AuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? bio = freezed,
    Object? image = freezed,
  }) {
    return _then(_$AuthorImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  const _$AuthorImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'bio') this.bio,
      @JsonKey(name: 'image') this.image});

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'bio')
  final String? bio;
  @override
  @JsonKey(name: 'image')
  final String? image;

  @override
  String toString() {
    return 'Author(id: $id, fullName: $fullName, bio: $bio, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, bio, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorImplToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  const factory _Author(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'bio') final String? bio,
      @JsonKey(name: 'image') final String? image}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'bio')
  String? get bio;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
