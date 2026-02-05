import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/quiz/models/my_block_response.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/check_answer_model.dart';
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
}
