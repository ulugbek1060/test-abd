import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/quiz/models/answer_response.dart';
import 'package:testabd/data/remote_source/quiz/models/block_detail_response.dart';
import 'package:testabd/data/remote_source/quiz/models/category_response.dart';
import 'package:testabd/data/remote_source/quiz/models/create_question_data_request.dart';
import 'package:testabd/data/remote_source/quiz/models/followed_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/bookmark_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/my_block_response.dart';
import 'package:testabd/data/remote_source/quiz/models/question_response.dart';
import 'package:testabd/data/remote_source/quiz/models/random_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/user_blocks_response.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'models/block_questions_response.dart';
import 'models/user_questions_response.dart';

abstract class QuizSource {
  /// ===================== Questions ========================
  Future<QuestionResponse> createQuestion(CreateQuestionDataRequest data);

  Future<QuestionResponse> updateQuestion(
    int questionId,
    CreateQuestionDataRequest data,
  );

  Future<UserQuestionsResponse> getUserQuestions(
    int userId,
    int page,
    int pageSize,
  );

  Future<QuestionResponse> getQuestionById(int questionId);

  Future<dynamic> bookmarkQuestions(int questionId);

  Future<RandomQuestionModel> getRandomQuestion(int page, int pageSize);

  Future<FollowedQuestionsResponse> getFollowedQuestions(
    int page,
    int pageSize,
  );

  Future<BookmarkQuestionsResponse> getQuestionsBookmark(
    int page,
    int pageSize,
  );

  /// ===================== Blocks ========================
  Future<BlockDetailResponse> createBlock(
    String title,
    String description,
    int categoryId,
    AccessType accessType,
  );

  Future<BlockDetailResponse> updateBlock(
    int blockId,
    String title,
    String description,
    int categoryId,
    AccessType accessType,
  );

  Future<BlockDetailResponse> getBlockById(int id);

  Future<BlockQuestionsResponse> getBlockTests(int blockId);

  Future<List<MyBlockResponse>> getMyBlocks();

  Future<UserBlocksResponse> getBlocksByUserId(
    int userId, {
    int? page,
    int? pageSize,
  });

  /// ===================== Others ========================
  Future<List<CategoryResponse>> getCategories();

  Future<AnswerResponse> submitAnswer(
    int questionId,
    Set<int> selectedAnswers,
    int? duration,
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
    Set<int> selectedAnswers,
    int? duration,
  ) async {
    try {
      final response = await _dio.post(
        '/quiz/submit-answer/',
        data: {
          "question": questionId,
          "selected_answer_ids": selectedAnswers.toList(),
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
  Future<UserBlocksResponse> getBlocksByUserId(
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
      return UserBlocksResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<UserQuestionsResponse> getUserQuestions(
    int userId,
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dio.get(
        '/quiz/questions/by-user/$userId/',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      return UserQuestionsResponse.fromJson(response.data);
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
      return response.data;
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BookmarkQuestionsResponse> getQuestionsBookmark(
    int page,
    int pageSize,
  ) async {
    try {
      final response = await _dio.get(
        '/quiz/question-bookmarks/',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
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
  Future<BlockDetailResponse> createBlock(
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
      return BlockDetailResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BlockDetailResponse> updateBlock(
    int blockId,
    String title,
    String description,
    int categoryId,
    AccessType accessType,
  ) async {
    try {
      final response = await _dio.put(
        '/quiz/tests/$blockId/',
        data: {
          "title": title,
          "description": description,
          "visibility": accessType.name,
          "category_id": categoryId,
        },
      );
      return BlockDetailResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<QuestionResponse> createQuestion(
    CreateQuestionDataRequest data,
  ) async {
    try {
      final response = await _dio.post('/quiz/questions/', data: data.toJson());
      return QuestionResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<QuestionResponse> updateQuestion(
    int questionId,
    CreateQuestionDataRequest data,
  ) async {
    try {
      final response = await _dio.put(
        '/quiz/questions/$questionId/',
        data: data.toJson(),
      );
      return QuestionResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<BlockDetailResponse> getBlockById(int id) async {
    try {
      final response = await _dio.get('/quiz/tests/$id/');
      return BlockDetailResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<QuestionResponse> getQuestionById(int questionId) async {
    try {
      final response = await _dio.get('/quiz/questions/$questionId/');
      return QuestionResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw error.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }
}
