import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/domain/books/entities/author_detail_model.dart';
import 'package:testabd/domain/books/entities/author_model.dart';
import 'package:testabd/domain/books/entities/book_detail_model.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

abstract class BooksRepository {
  Future<Either<AppException, PagedData<BookModel>>> getBooks();
  Future<Either<AppException, PagedData<AuthorModel>>> getAuthors();
  Future<Either<AppException, AuthorDetailModel>> getAuthorById(int authorId);
  Future<Either<AppException, BookDetailModel>> getBookById(int bookId);
  Future<Either<AppException, dynamic>> bookDashboard();
  // Future<Either<AppException, dynamic>> getBookReadingSession();
}
