import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/block_detail_model.dart';

part 'block_detail_state.freezed.dart';

@freezed
class BlockDetailState with _$BlockDetailState {
  const factory BlockDetailState({
    @Default(false) bool isLoading,
    String? error,
    BlockDetailModel? blockDetail,
  }) = _BlockDetailState;
}
