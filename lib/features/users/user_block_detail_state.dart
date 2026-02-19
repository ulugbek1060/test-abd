import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';
import 'package:testabd/domain/entity/block_model.dart';

part 'user_block_detail_state.freezed.dart';

@freezed
class UserBlockDetailState with _$UserBlockDetailState {
  const factory UserBlockDetailState({
    String? error,
    @Default(false) bool isLoading,
    BlockDetailModel? block,
  }) = _UserBlockDetailState;
}
