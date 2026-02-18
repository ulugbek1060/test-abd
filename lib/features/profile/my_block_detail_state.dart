import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';

part 'my_block_detail_state.freezed.dart';

@freezed
class MyBlockDetailState with _$MyBlockDetailState {
  const factory MyBlockDetailState({
    @Default(false) bool isLoading,
    String? error,
    BlockDetailModel? blockDetail,
  }) = _MyBlockDetailState;
}
