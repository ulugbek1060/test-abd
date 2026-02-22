import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/create_question_data_arg.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';

abstract class QuizRepository {
  Future<Either<AppException, PagedData<String, QuestionModel>>>
  getFollowedQuestions({required int page, required int pageSize});

  Future<Either<AppException, CheckAnswerModel>> submitAnswer({
    required int questionId,
    required Set<int> selectedAnswers,
    int? duration,
  });

  Future<Either<AppException, dynamic>> getUserQuestions(
    int userId,
  );

  Future<Either<AppException, PagedData<String, BlockModel>>> getBocksByUserId(
    int userId, {
    int? page,
    int? pageSize,
  });

  Future<Either<AppException, QuestionsBookmarkModel>> getQuestionsBookmark();

  Future<Either<AppException, List<MyBlockModel>>> getMyBlocks();

  Future<Either<AppException, List<CategoryModel>>> getCategories();

  Future<Either<AppException, BlockDetailModel>> createBlock({
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  });

  Future<Either<AppException, BlockDetailModel>> updateBlock({
    required int blockId,
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  });

  Future<Either<AppException, QuestionModel>> createQuestion({
    required CreateQuestionModel model,
  });
  Future<Either<AppException, QuestionModel>> updateQuestion({
    required int questionId,
    required CreateQuestionModel model,
  });
  Future<Either<AppException, PagedData<String, QuestionModel>>>
  getMyQuestions({required String page, required int pageSize});
  Future<Either<AppException, BlockDetailModel>> getBlockById(int id);
  Future<Either<AppException, QuestionModel>> getQuestionById(int questionId);
  Future<Either<AppException, dynamic>> bookmarkQuestion(int questionId);

}
