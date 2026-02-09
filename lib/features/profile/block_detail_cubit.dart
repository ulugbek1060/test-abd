import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/block_detail_state.dart';
import 'package:testabd/main.dart';

@injectable
class BlockDetailCubit extends Cubit<BlockDetailState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _appMessageHandler;
  final int id;

  @factoryMethod
  BlockDetailCubit.create(
    @factoryParam this.id,
    this._quizRepository,
    this._appMessageHandler,
  ) : super(BlockDetailState());

  Future<void> fetchBlock() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.getBlockById(id);
    result.fold(
      (error) {
        _appMessageHandler.handleDialog(error);
        emit(state.copyWith(error: error.message, isLoading: false));
      },
      (value) {
        emit(state.copyWith(blockDetail: value, isLoading: false));
      },
    );
  }
}
