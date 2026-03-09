import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'read_book_state.dart';

class ReadBookCubit extends Cubit<ReadBookState> {
  ReadBookCubit() : super(ReadBookInitial());
}
