import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/quiz/quiz_source.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/quiz/entities/global_quiz_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';
import 'package:testabd/domain/quiz/entities/quiz_item.dart';
import 'package:testabd/domain/quiz/entities/topics_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';

@LazySingleton(as: QuizRepository)
class QuizRepositoryImpl extends QuizRepository {
  final QuizSource _quizSource;

  QuizRepositoryImpl(this._quizSource);

  @override
  Future<Either<AppException, GlobalQuizModel>> getFollowedQuestions({
    required int page,
    required int pageSize,
  }) async {
    try {
      final result = await _quizSource.getFollowedQuestions(page, pageSize);
      return Right(GlobalQuizModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, CheckAnswerModel>> submitAnswer({
    required int questionId,
    required List<int> selectedAnswers,
    int? duration,
  }) async {
    try {
      final result = await _quizSource.submitAnswer(
        questionId,
        selectedAnswers,
        duration,
      );
      return Right(CheckAnswerModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, TopicsModel>> getTopics(
    int userId, {
    int? page,
    int? pageSize,
  }) async {
    try {
      final result = await _quizSource.getTopics(
        userId,
        page: page,
        pageSize: pageSize,
      );
      return Right(TopicsModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<QuizItem>>> getUserQuestions(
    int userId,
  ) async {
    try {
      final result = await _quizSource.getUserQuestions(userId);
      final list = result.map(QuizItem.fromResponse).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, QuestionsBookmarkModel>>
  getQuestionsBookmark() async {
    try {
      final result = await _quizSource.getQuestionsBookmark();
      return Right(QuestionsBookmarkModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<MyQuestionModel>>> getMyBlocks() async {
    try {
      final result = await _quizSource.getMyBlocks();
      final list = result.map(MyQuestionModel.fromResponse).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<CategoryModel>>> getCategories() async {
    try {
      final result = await _quizSource.getCategories();
      final list = result.map(CategoryModel.fromResponse).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }
}
