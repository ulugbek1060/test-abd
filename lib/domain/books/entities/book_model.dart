import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/books/models/books_response.dart'
    as book;
import 'package:testabd/data/remote_source/books/models/reading_sessions_response.dart'
    as session;
import 'package:testabd/data/remote_source/books/models/start_session_response.dart'
as startSession;
import 'package:testabd/domain/books/entities/author_model.dart';
import 'package:testabd/domain/books/entities/book_detail_model.dart';

class BookModel extends Equatable {
  final int? id;
  final AuthorModel? author;
  final List<dynamic>? tags;
  final String? title;
  final String? coverImage;
  final String? description;
  final String? pdfFile;
  final String? epubFile;
  final int? totalPages;
  final DateTime? createdAt;

  const BookModel({
    this.id,
    this.author,
    this.tags,
    this.title,
    this.coverImage,
    this.description,
    this.pdfFile,
    this.epubFile,
    this.totalPages,
    this.createdAt,
  });

  static BookModel fromResponse(book.Book response) {
    return BookModel(
      id: response.id,
      author: AuthorModel(
        id: response.author?.id,
        fullName: response.author?.fullName,
        bio: response.author?.bio,
        image: response.author?.image,
      ),
      tags: response.tags,
      title: response.title,
      coverImage: response.coverImage,
      description: response.description,
      pdfFile: response.pdfFile,
      epubFile: response.epubFile,
      totalPages: response.totalPages,
      createdAt: response.createdAt,
    );
  }

  static BookModel fromSessionResponse(session.Book? response) {
    return BookModel(
      id: response?.id,
      author: AuthorModel(
        id: response?.author?.id,
        fullName: response?.author?.fullName,
        bio: response?.author?.bio,
        image: response?.author?.image,
      ),
      tags: response?.tags,
      title: response?.title,
      coverImage: response?.coverImage,
      description: response?.description,
      pdfFile: response?.pdfFile,
      epubFile: response?.epubFile,
      totalPages: response?.totalPages,
      createdAt: response?.createdAt,
    );
  }

  static BookModel fromBookDetailModel(BookDetailModel? model) {
    return BookModel(
      id: model?.id,
      author: AuthorModel(
        id: model?.author?.id,
        fullName: model?.author?.fullName,
        bio: model?.author?.bio,
        image: model?.author?.image,
      ),
      tags: model?.tags,
      title: model?.title,
      coverImage: model?.coverImage,
      description: model?.description,
      pdfFile: model?.pdfFile,
      epubFile: model?.epubFile,
      totalPages: model?.totalPages,
      createdAt: model?.createdAt,
    );
  }

  static BookModel fromStartSessionResponse(startSession.Book? model) {
    return BookModel(
      id: model?.id,
      author: AuthorModel(
        id: model?.author?.id,
        fullName: model?.author?.fullName,
        bio: model?.author?.bio,
        image: model?.author?.image,
      ),
      tags: model?.tags,
      title: model?.title,
      coverImage: model?.coverImage,
      description: model?.description,
      pdfFile: model?.pdfFile,
      epubFile: model?.epubFile,
      totalPages: model?.totalPages,
      createdAt: model?.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    author,
    tags,
    title,
    coverImage,
    description,
    pdfFile,
    epubFile,
    totalPages,
    createdAt,
  ];
}
