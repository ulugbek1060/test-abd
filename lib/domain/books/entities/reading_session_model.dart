import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/data/remote_source/books/models/reading_sessions_response.dart'
    as session;
import 'package:testabd/data/remote_source/books/models/start_session_response.dart'
    as readinSession;

class ReadingSessionModel {
  int? id;
  BookModel? book;
  String? mode;
  String? status;
  int? targetPage;
  DateTime? createdAt;

  ReadingSessionModel({
    this.id,
    this.book,
    this.mode,
    this.status,
    this.targetPage,
    this.createdAt,
  });

  static ReadingSessionModel fromResponse(session.Session response) {
    return ReadingSessionModel(
      id: response.id,
      book: BookModel.fromSessionResponse(response.book),
      mode: response.mode,
      status: response.status,
      targetPage: response.targetPage,
      createdAt: response.createdAt,
    );
  }

  static ReadingSessionModel fromStartSessionResponse(
    readinSession.StartSessionResponse response,
  ) {
    return ReadingSessionModel(
      id: response.id,
      book: BookModel.fromStartSessionResponse(response.book),
      mode: response.mode,
      status: response.status,
      targetPage: response.targetPage,
      createdAt: response.createdAt,
    );
  }
}
