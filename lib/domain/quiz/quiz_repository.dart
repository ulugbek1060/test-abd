import 'package:dartz/dartz.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/domain/entity/access_enum.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/quiz/entities/global_quiz_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';
import 'package:testabd/domain/quiz/entities/questions_bookmark_model.dart';
import 'package:testabd/domain/quiz/entities/quiz_item.dart';
import 'package:testabd/domain/quiz/entities/topics_model.dart';

abstract class QuizRepository {
  Future<Either<AppException, GlobalQuizModel>> getFollowedQuestions({
    required int page,
    required int pageSize,
  });
  Future<Either<AppException, CheckAnswerModel>> submitAnswer({
    required int questionId,
    required List<int> selectedAnswers,
    int? duration,
  });
  Future<Either<AppException, List<QuizItem>>> getUserQuestions(int userId);
  Future<Either<AppException, TopicsModel>> getTopics(
    int userId, {
    int? page,
    int? pageSize,
  });
  Future<Either<AppException, QuestionsBookmarkModel>> getQuestionsBookmark();
  Future<Either<AppException, List<MyBlockModel>>> getMyBlocks();
  Future<Either<AppException, List<CategoryModel>>> getCategories();
  Future<Either<AppException, MyBlockModel>> createBlock({
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  });
  Future<Either<AppException, QuestionModel>> createQuestion({
    required int blockId,
    required String questionText,
    required QuestionType questionType,
    required int categoryId,
    required List<AnswerItemModel> answers,
  });
  Future<Either<AppException, PagedData<String, QuestionModel>>> getMyQuestions({
    required String page,
    required int pageSize,
  });
}
