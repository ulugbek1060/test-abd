import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/features/home/notifications_state.dart';
import 'package:testabd/main.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final AccountRepository _accountRepository;
  final AppMessageHandler _appMessageHandler;

  NotificationsCubit(this._accountRepository, this._appMessageHandler)
    : super(NotificationsState());

  Future<void> fetchData() async {
    emit(state.copyWith(isLoading: true));

    final result = await _accountRepository.getNotifications();

    result.fold(
      (error) {
        _appMessageHandler.handleDialog(error);
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(
          state.copyWith(isLoading: false, notifications: value, error: null),
        );
      },
    );
  }
}
