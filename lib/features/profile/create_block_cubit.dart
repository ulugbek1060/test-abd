import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/entity/access_enum.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';

part 'create_block_state.dart';

@injectable
class CreateBlockCubit extends Cubit<CreateBlockState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;

  CreateBlockCubit(this._quizRepository, this._messageHandler)
    : super(CreateBlockInitial());

  void fetchCategories() async {}

  void submit({
    required String title,
    required String description,
    required int categoryId,
    required AccessType accessType,
  }) async {}
}
