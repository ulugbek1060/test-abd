import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';
import 'package:testabd/domain/quiz/quiz_repository.dart';
import 'package:testabd/features/profile/create_block_state.dart';
import 'package:testabd/features/profile/profile_cubit.dart';

@injectable
class CreateBlockCubit extends Cubit<CreateBlockState> {
  final QuizRepository _quizRepository;
  final AppMessageHandler _messageHandler;
  final UpdateListener _updateListener;
  final int? blockId;

  @factoryMethod
  CreateBlockCubit(
    @factoryParam this.blockId,
    this._quizRepository,
    this._messageHandler,
    @Named.from(ProfileBlockUpdater) this._updateListener,
  ) : super(CreateBlockState()) {
    fetchBlockById();
  }

  Future<void> fetchBlockById() async {
    await fetchCategories();

    if (blockId == null) return;
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _quizRepository.getBlockById(blockId!);
    result.fold(
      (error) {
        emit(state.copyWith(error: error.message, isLoading: false));
        _messageHandler.handleDialog(error);
      },
      (value) {
        emit(
          state.copyWith(
            isLoading: false,
            block: value,
            selectedAccessType: value.visibility,
            selectedCategory: state.categories.firstWhereOrNull(
              (e) => e.id == value.category?.id,
            ),
          ),
        );
      },
    );
  }

  Future<void> reset() async {
    emit(CreateBlockState());
  }

  Future<void> refresh() async => fetchCategories();

  Future<void> fetchCategories() async {
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

  Future<void> submit({
    required String title,
    required String description,
  }) async {
    if (state.isLoading) return;

    if (state.selectedAccessType == null) {
      _messageHandler.handleDialog(
        UnknownErrorMsg("Visibility type is required"),
      );
      return;
    }
    if (state.selectedCategory?.id == null) {
      _messageHandler.handleDialog(UnknownErrorMsg("Category is required"));
      return;
    }
    if (title.isEmpty) {
      _messageHandler.handleDialog(UnknownErrorMsg("Title is required"));
      return;
    }
    if (description.isEmpty) {
      _messageHandler.handleDialog(UnknownErrorMsg("Description is required"));
      return;
    }

    emit(state.copyWith(isLoading: true));

    Either<Messenger, BlockDetailModel> result;

    if (blockId != null) {
      /// update existing block option
      result = await _quizRepository.updateBlock(
        blockId: blockId!,
        title: title,
        description: description,
        categoryId: state.selectedCategory!.id!,
        accessType: state.selectedAccessType!,
      );
    } else {
      /// create new block option
      result = await _quizRepository.createBlock(
        title: title,
        description: description,
        categoryId: state.selectedCategory!.id!,
        accessType: state.selectedAccessType!,
      );
    }

    result.fold(
      (e) {
        emit(state.copyWith(error: e.message, isLoading: false));
        _messageHandler.handleDialog(e);
      },
      (value) {
        emit(state.copyWith(isLoading: false, block: value));
        _updateListener.onUpdate();
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
      SuccessMsg("Block created successfully"),
    );
  }
}
