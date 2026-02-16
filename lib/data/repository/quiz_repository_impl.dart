import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/data/remote_source/quiz/models/create_question_data_request.dart';
import 'package:testabd/data/remote_source/quiz/quiz_source.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/create_question_data_arg.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';

@LazySingleton(as: QuizRepository)
class QuizRepositoryImpl extends QuizRepository {
  final QuizSource _quizSource;

  QuizRepositoryImpl(this._quizSource);

  @override
  Future<Either<AppException, PagedData<String, QuestionModel>>>
  getFollowedQuestions({required int page, required int pageSize}) async {
    try {
      final result = await _quizSource.getFollowedQuestions(page, pageSize);
      final data = PagedData(
        count: result.count,
        next: result.next,
        previous: result.previous,
        data: result.results.map(QuestionModel.fromFollowedResponse).toList(),
      );
      return Right(data);
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
  Future<Either<AppException, PagedData<String, BlockModel>>> getBocksByUserId(
    int userId, {
    int? page,
    int? pageSize,
  }) async {
    try {
      final result = await _quizSource.getBlocksByUserId(
        userId,
        page: page,
        pageSize: pageSize,
      );
      final data = PagedData(
        next: result.next,
        previous: result.previous,
        data: result.results.map(BlockModel.fromResponse).toList(),
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<QuestionModel>>> getUserQuestions(
    int userId,
  ) async {
    try {
      final result = await _quizSource.getUserQuestions(userId);
      final list = result.map(QuestionModel.fromUserQuestionResponse).toList();
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
  Future<Either<AppException, List<MyBlockModel>>> getMyBlocks() async {
    try {
      final result = await _quizSource.getMyBlocks();
      final list = result.map(MyBlockModel.fromResponse).toList();
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

  @override
  Future<Either<AppException, BlockDetailModel>> createBlock({
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  }) async {
    try {
      final result = await _quizSource.createBlock(
        title,
        description,
        categoryId,
        accessType,
      );
      return Right(BlockDetailModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, QuestionModel>> createQuestion({
    required CreateQuestionModel model,
  }) async {
    try {
      final data = CreateQuestionDataRequest(
        test: model.test,
        questionText: model.questionText,
        questionType: QuestionType.fromEnum(model.questionType),
        orderIndex: model.orderIndex,
        categoryId: model.categoryId,
        answers: model.answers
            ?.map(
              (e) => CreateAnswerRequest(
                letter: e.letter,
                answerText: e.answerText,
                isCorrect: e.isCorrect,
              ),
            )
            .toList(),
      );
      final result = await _quizSource.createQuestion(data);
      return Right(QuestionModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, PagedData<String, QuestionModel>>>
  getMyQuestions({required String page, required int pageSize}) async {
    try {
      final result = await _quizSource.getMyQuestions(
        page: page,
        pageSize: pageSize,
      );
      final data = PagedData(
        count: result.count,
        next: result.next,
        previous: result.previous,
        data: result.results
            .map(QuestionModel.fromProfileQuestionResponse)
            .toList(),
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, BlockDetailModel>> getBlockById(int id) async {
    try {
      final result = await _quizSource.getBlockById(id);
      return Right(BlockDetailModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<dynamic> getQuestionById(int questionId) async {
    try {
      final result = await _quizSource.getQuestionById(questionId);
      return Right(QuestionModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }
}
