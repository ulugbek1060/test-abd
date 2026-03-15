import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/account/account_repository.dart';
import 'package:testabd/features/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final AccountRepository _accountRepository;
  final AppMessageHandler _messageHandler;

  final int _pageSize = 10;

  SearchCubit(this._accountRepository, this._messageHandler)
    : super(SearchState());

  void load() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await _accountRepository.searchAccount(
      query: "abdulaziz",
      page: 1,
      pageSize: _pageSize,
    );
    result.fold(
      (error) {
        _messageHandler.handleDialog(error);
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (value) {
        emit(state.copyWith(isLoading: false, error: null, data: value));
      },
    );
  }
}
