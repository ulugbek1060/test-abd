import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/create_block_state.dart';

@injectable
class CreateBlockCubit extends Cubit<CreateBlockState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;

  CreateBlockCubit(this._quizRepository, this._messageHandler)
    : super(CreateBlockState());

  Future<void> reset() async {
    emit(CreateBlockState());
  }

  Future<void> refresh() async => fetchCategories();

  void fetchCategories() async {
    final result = await _quizRepository.getCategories();
    result.fold(
      (e) {
        emit(state.copyWith(error: e.message));
        _messageHandler.handleDialog(e);
      },
      (value) {
        emit(state.copyWith(categories: value));
      },
    );
  }

  void submit({required String title, required String description}) async {
    if (state.isLoading) return;
    if (state.selectedCategory?.id == null) {
      _messageHandler.handleDialog(UnknownException("Category is required"));
      return;
    }
    if (title.isEmpty) {
      _messageHandler.handleDialog(UnknownException("Title is required"));
      return;
    }
    if (description.isEmpty) {
      _messageHandler.handleDialog(UnknownException("Description is required"));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.createBlock(
      title: title,
      description: description,
      categoryId: state.selectedCategory!.id!,
      accessType: state.selectedAccessType,
    );

    result.fold(
      (e) {
        emit(state.copyWith(error: e.message, isLoading: false));
        _messageHandler.handleDialog(e);
      },
      (value) {
        emit(state.copyWith(isLoading: false, block: value));
      },
    );
  }

  void selectCategory(int? v) => emit(
    state.copyWith(
      selectedCategory: state.categories.firstWhereOrNull((e) => e.id == v),
    ),
  );

  void selectAccessType(AccessType? v) {
    if (v == null) return;
    emit(state.copyWith(selectedAccessType: v));
  }

  void successMessage() async {
    _messageHandler.handleDialog(
      SuccessException("Block created successfully"),
    );
  }
}
