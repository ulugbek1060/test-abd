import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/domain/books/books_repository.dart';
import 'package:testabd/features/library/author_detail_state.dart';

@injectable
class AuthorDetailCubit extends Cubit<AuthorDetailState> {
  final BooksRepository _booksRepository;
  final AppMessageHandler _messageHandler;
  final int? authorId;

  @factoryMethod
  AuthorDetailCubit(
    @factoryParam this.authorId,
    this._messageHandler,
    this._booksRepository,
  ) : super(AuthorDetailState.initial());


  Future<void> getAuthor() async {
    if (state.isLoading || authorId == null) return;

    emit(state.copyWith(isLoading: true));

    final result = await _booksRepository.getAuthorById(authorId!);
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
