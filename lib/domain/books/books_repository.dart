import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

abstract class BooksRepository {
  Future<Either<AppException, PagedData<String, BookModel>>> getBooks();
}
