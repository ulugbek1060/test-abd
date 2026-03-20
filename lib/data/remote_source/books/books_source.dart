// books/authors/ mualliflarni olish yozish o'chirishi CRUD
// books/books/ kitoblarni olish yozish hokazo

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/books/models/author_detail_response.dart';
import 'package:testabd/data/remote_source/books/models/authors_response.dart';
import 'package:testabd/data/remote_source/books/models/book_detail_response.dart';
import 'package:testabd/data/remote_source/books/models/books_response.dart';

abstract class BooksSource {
  Future<AuthorsResponse> getAuthor();
  Future<BooksResponse> getBooks();
  Future<AuthorDetailResponse> getAuthorById(int authorId);
  Future<BookDetailResponse> getBookById(int bookId);
  Future<dynamic> getDashboard();
}

@Injectable(as: BooksSource)
class BooksSourceImpl implements BooksSource {
  final Dio _dio;

  BooksSourceImpl(this._dio);

  @override
  Future<AuthorsResponse> getAuthor() async {
    try {
      final response = await _dio.get("/books/authors/");
      return AuthorsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BooksResponse> getBooks() async {
    try {
      final response = await _dio.get("/books/books/");
      return BooksResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<AuthorDetailResponse> getAuthorById(int authorId) async {
    try {
      final response = await _dio.get("/books/authors/$authorId");
      return AuthorDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BookDetailResponse> getBookById(int bookId) async {
    try {
      final response = await _dio.get("/books/books/$bookId");
      return BookDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<dynamic> getDashboard() async {
    try {
      final response = await _dio.get("/books/dashboard/");
      return response.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownErrorMsg(e.toString(), stackTrace: stackTrace);
    }
  }
}
