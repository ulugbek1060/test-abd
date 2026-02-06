import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testabd/domain/entity/access_enum.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/quiz/entities/my_qursion_model.dart';

part 'create_block_state.freezed.dart';

@freezed
class CreateBlockState with _$CreateBlockState {
  const factory CreateBlockState({
    String? error,
    @Default(false) bool isLoading,
    MyBlockModel? block,
    @Default([]) List<CategoryModel> categories,
    CategoryModel? selectedCategory,
    @Default(AccessType.public) AccessType selectedAccessType,
  }) = _CreateBlockState;
}
