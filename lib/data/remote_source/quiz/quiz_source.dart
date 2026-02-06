import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/quiz/models/answer_response.dart';
import 'package:testabd/data/remote_source/quiz/models/category_response.dart';
import 'package:testabd/data/remote_source/quiz/models/followed_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/bookmark_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/my_block_response.dart';
import 'package:testabd/data/remote_source/quiz/models/question_response.dart';
import 'package:testabd/data/remote_source/quiz/models/random_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/topic_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/user_question_response.dart';
import 'package:testabd/domain/entity/access_enum.dart';

import 'models/block_questions_response.dart';

abstract class QuizSource {
  Future<FollowedQuestionsResponse> getFollowedQuestions(
    int page,
    int pageSize,
  );

  Future<AnswerResponse> submitAnswer(
    int questionId,
    List<int> selectedAnswers,
    int? duration,
  );

  Future<TopicQuestionsResponse> getTopics(
    int userId, {
    int? page,
    int? pageSize,
  });

  Future<List<UserQuestionResponse>> getUserQuestions(int userId);

  Future<BlockQuestionsResponse> getBlockTests(int blockId);

  Future<dynamic> bookmarkQuestions(int questionId);

  Future<BookmarkQuestionsResponse> getQuestionsBookmark();

  Future<List<CategoryResponse>> getCategories();

  Future<RandomQuestionModel> getRandomQuestion(int page, int pageSize);

  Future<List<MyBlockResponse>> getMyBlocks();

  Future<MyBlockResponse> createBlock(
    String title,
    String description,
    int categoryId,
    AccessType accessType,
  );

  Future<QuestionResponse> createQuestion(
    int blockId,
    String questionText,
    QuestionType questionType,
    int categoryId,
    List<AnswerModel> answers,
  );
}

/// =========================> Source implementation <=========================
@Injectable(as: QuizSource)
class QuizSourceImpl implements QuizSource {
  final Dio _dio;

  QuizSourceImpl(this._dio);

  @override
  Future<List<CategoryResponse>> getCategories() async {
    try {
      final response = await _dio.get('/quiz/categories/');
      final list = (response.data as List<dynamic>)
          .map((e) => CategoryResponse.fromJson(e))
          .toList();
      return list;
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<FollowedQuestionsResponse> getFollowedQuestions(
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dio.get(
        '/quiz/recommended/followed-questions/',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      return FollowedQuestionsResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<AnswerResponse> submitAnswer(
    int questionId,
    List<int> selectedAnswers,
    int? duration,
  ) async {
    try {
      final response = await _dio.post(
        '/quiz/submit-answer/',
        data: {
          "question": questionId,
          "selected_answer_ids": selectedAnswers,
          "duration": duration ?? 2,
        },
      );
      return AnswerResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<TopicQuestionsResponse> getTopics(
    int userId, {
    int? page,
    int? pageSize,
  }) async {
    try {
      final response = await _dio.get(
        '/quiz/tests/by_user/$userId/',
        queryParameters: {
          'user_id': userId,
          if (page != null) 'page': page,
          if (page != null) 'page_size': pageSize,
        },
      );
      return TopicQuestionsResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<UserQuestionResponse>> getUserQuestions(int userId) async {
    try {
      final response = await _dio.get(
        '/quiz/questions/user_questions/',
        queryParameters: {'user_id': userId},
      );
      final list = (response.data as List)
          .map((e) => UserQuestionResponse.fromJson(e))
          .toList();
      return list;
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BlockQuestionsResponse> getBlockTests(int blockId) async {
    try {
      final response = await _dio.get('/quiz/tests/$blockId/');
      return BlockQuestionsResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<RandomQuestionModel> getRandomQuestion(int page, int pageSize) async {
    try {
      final response = await _dio.get(
        '/quiz/random/',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      return RandomQuestionModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<dynamic> bookmarkQuestions(int questionId) async {
    try {
      final response = await _dio.post(
        '/quiz/question-bookmarks/',
        data: {"question": questionId},
      );
      return RandomQuestionModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BookmarkQuestionsResponse> getQuestionsBookmark() async {
    try {
      final response = await _dio.get('/quiz/question-bookmarks/');
      return BookmarkQuestionsResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<MyBlockResponse>> getMyBlocks() async {
    try {
      final response = await _dio.get('/quiz/tests/my_tests/');
      return (response.data as List)
          .map((e) => MyBlockResponse.fromJson(e))
          .toList();
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<MyBlockResponse> createBlock(
    String title,
    String description,
    int categoryId,
    AccessType accessType,
  ) async {
    try {
      final response = await _dio.post(
        '/quiz/tests/',
        data: {
          "title": title,
          "description": description,
          "visibility": accessType.name,
          "category_id": categoryId,
        },
      );
      return MyBlockResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<QuestionResponse> createQuestion(
    int blockId,
    String questionText,
    QuestionType questionType,
    int categoryId,
    List<AnswerModel> answers,
  ) async {
    // {
    // "test" : 143,
    // "question_text" : "qwerty",
    // "question_type" : "single",
    // "order_index" : 1770360737846,
    // "category_id" : 34,
    // "answers" : [
    //    {
    //     "letter" : "A",
    //     "answer_text" : "qwert",
    //     "is_correct" : false
    //    },
    //    {
    //      "letter" : "B",
    //      "answer_text" : "qwert",
    //      "is_correct" : true
    //     },
    //     {
    //      "letter" : "D",
    //      "answer_text" : "qwert",
    //      "is_correct" : false
    //      }
    //  ]
    // }
    try {
      final response = await _dio.post(
        '/quiz/tests/',
        data: {
          "test": blockId,
          "question_text": questionText,
          "question_type": QuestionType.fromEnum(questionType),
          "category_id": categoryId,
          "answers": answers.map((e) => e.toJson()).toList(),
        },
      );
      return QuestionResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }
}
