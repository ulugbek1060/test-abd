import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/domain/books/entities/reading_session_model.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';
import 'package:testabd/domain/entity/block_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/create_question_data_arg.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';

abstract class QuizRepository {
  // ------------------------------------------------------
  // Blocks
  // ------------------------------------------------------
  Future<Either<Messenger, List<MyBlockModel>>> getMyBlocks();

  Future<Either<Messenger, BlockDetailModel>> createBlock({
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  });

  Future<Either<Messenger, BlockDetailModel>> updateBlock({
    required int blockId,
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  });

  Future<Either<Messenger, PagedData<BlockModel>>> getBocksByUserId({
    required int userId,
    int? page,
    int? pageSize,
  });

  Future<Either<Messenger, BlockDetailModel>> getBlockById(int id);

  // ------------------------------------------------------
  // Questions
  // ------------------------------------------------------
  Future<Either<Messenger, QuestionModel>> createQuestion({
    required CreateQuestionModel model,
  });

  Future<Either<Messenger, QuestionModel>> updateQuestion({
    required int questionId,
    required CreateQuestionModel model,
  });

  Future<Either<Messenger, QuestionModel>> getQuestionById(int questionId);

  Future<Either<Messenger, PagedData<QuestionModel>>> getQuestionsBookmark({
    required int pageSize,
    required int page,
  });

  Future<Either<Messenger, PagedData<QuestionModel>>> getUserQuestions(
    int userId,
    int page,
    int pageSize,
  );

  Future<Either<Messenger, dynamic>> bookmarkQuestion(int questionId);

  // ------------------------------------------------------
  // Others
  // ------------------------------------------------------
  Future<Either<Messenger, List<CategoryModel>>> getCategories();

  Future<Either<Messenger, PagedData<QuestionModel>>> getFollowedQuestions({
    required int page,
    required int pageSize,
  });

  Future<Either<Messenger, CheckAnswerModel>> submitAnswer({
    required int questionId,
    required Set<int> selectedAnswers,
    int? duration,
  });

  Future<Either<Messenger, PagedData<ReadingSessionModel>>>
  getReadingSessions({int? page, int? pageSize});
}
