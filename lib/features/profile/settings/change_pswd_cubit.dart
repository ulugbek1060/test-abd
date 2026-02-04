import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/features/profile/settings/change_pswd_state.dart';

@injectable
class ChangePswdCubit extends Cubit<ChangePswdState> {
  final AccountRepository _accountRepository;
  final AppMessageHandler _messageHandler;

  ChangePswdCubit(this._accountRepository, this._messageHandler)
    : super(ChangePswdState());

  void changePassword({
    required String oldPswd,
    required String newPswd,
    required String confirmPswd,
  }) async {
    if (oldPswd.isEmpty) {
      _messageHandler.handleSnackBar(
        UnknownException('Please fill in the old password'),
      );
      return;
    }
    if (newPswd.isEmpty) {
      _messageHandler.handleSnackBar(
        UnknownException('Please fill in the new password'),
      );
      return;
    }
    if (confirmPswd.isEmpty) {
      _messageHandler.handleSnackBar(
        UnknownException('Please fill in the confirm password'),
      );
      return;
    }
    if (confirmPswd != newPswd) {
      _messageHandler.handleSnackBar(
        UnknownException('Please correct the password'),
      );
      return;
    }

    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _accountRepository.changePassword(
      oldPswd: oldPswd,
      newPswd: newPswd,
      confirmPswd: confirmPswd,
    );

    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(state.copyWith(isLoading: false));
      },
      (value) {
        emit(
          state.copyWith(isLoading: false, isSuccess: true, isEditModel: false),
        );
        _messageHandler.handleDialog(
          SuccessException('Your password has been successfully changed'),
        );
      },
    );
  }

  void toggleEditMode() =>
      emit(state.copyWith(isEditModel: !state.isEditModel));
}
