import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/question_detail_state.dart';

class QuestionDetailCubit extends Cubit<QuestionDetailState> {
  final int questionId;
  final QuizRepository _quizRepository;

  @factoryMethod
  QuestionDetailCubit.create(
    @factoryParam this.questionId,
    this._quizRepository,
  ) : super(QuestionDetailState());


  void load(){

  }
}
