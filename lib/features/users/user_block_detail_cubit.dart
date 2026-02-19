import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/users/user_block_detail_state.dart';

@injectable
class UserBlockDetailCubit extends Cubit<UserBlockDetailState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _appMessageHandler;
  final int? blockId;

  @factoryMethod
  UserBlockDetailCubit(
    @factoryParam this.blockId,
    this._quizRepository,
    this._appMessageHandler,
  ) : super(UserBlockDetailState());

  fetchBlock() {}


}
