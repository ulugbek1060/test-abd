import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/books/models/books_response.dart';

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

  static BookModel fromResponse(Book response) {
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

class AuthorModel extends Equatable {
  final int? id;
  final String? fullName;
  final String? bio;
  final String? image;

  const AuthorModel({this.id, this.fullName, this.bio, this.image});

  @override
  List<Object?> get props => [id, fullName, bio, image];
}
