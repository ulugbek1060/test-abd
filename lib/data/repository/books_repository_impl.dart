import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/data/remote_source/books/books_source.dart';
import 'package:testabd/domain/books/books_repository.dart';
import 'package:testabd/domain/books/entities/author_model.dart';
import 'package:testabd/domain/books/entities/book_model.dart';

@Singleton(as: BooksRepository)
class BooksRepositoryImpl implements BooksRepository {
  final BooksSource _booksSource;

  BooksRepositoryImpl(this._booksSource);

  @override
  Future<Either<AppException, PagedData<BookModel>>> getBooks() async {
    try {
      final result = await _booksSource.getBooks();
      final data = PagedData(
        count: result.count,
        next: result.next,
        previous: result.previous,
        data: result.results.map(BookModel.fromResponse).toList(),
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnauthorizedException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, PagedData<AuthorModel>>> getAuthors() async {
    try {
      final result = await _booksSource.getAuthor();
      final data = PagedData(
        count: result.count,
        next: result.next,
        previous: result.previous,
        data: result.results.map(AuthorModel.fromResponse).toList(),
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnauthorizedException(e.toString(), stackTrace: stackTrace));
    }
  }
}
