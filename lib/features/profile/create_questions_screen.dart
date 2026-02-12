import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/create_question_cubit.dart';
import 'package:testabd/features/profile/create_question_state.dart';

class CreateQuestionsScreen extends StatelessWidget {
  const CreateQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<CreateQuestionCubit>()..fetchData(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _questionTitle;
  late final TextEditingController _questionDescription;
  int randomSeed = 0;

  @override
  void initState() {
    randomSeed = Random().nextInt(100);
    _questionTitle = TextEditingController();
    _questionDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _questionTitle.dispose();
    _questionDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CreateQuestionCubit, CreateQuestionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Block')),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // submit logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save changes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),

          body: state.isLoading
              ? ProgressView()
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Category
                      _DropdownField(
                        label: "Category",
                        hint: "Select category",
                        value: state.selectedCategory?.id,
                        items: state.categories
                            .map(
                              (e) => _DropdownItem(
                                id: e.id ?? 0,
                                name: e.title ?? '',
                              ),
                            )
                            .toList(),
                        onChanged: context
                            .read<CreateQuestionCubit>()
                            .selectCategory,
                      ),

                      /// Category
                      _DropdownField(
                        label: "Blocks",
                        hint: "Select block",
                        value: state.selectedBlock?.id,
                        items: state.blocks
                            .map(
                              (e) => _DropdownItem(
                                id: e.id ?? 0,
                                name: e.title ?? "",
                              ),
                            )
                            .toList(),
                        onChanged: context
                            .read<CreateQuestionCubit>()
                            .selectBlock,
                      ),

                      /// Question type
                      _DropdownField(
                        label: "Question type",
                        hint: "Select category",
                        value: 0,
                        items: QuestionType.values
                            .mapIndexed(
                              (i, e) => _DropdownItem(
                                id: i,
                                name: e.getName(context),
                              ),
                            )
                            .toList(),
                        onChanged: context
                            .read<CreateQuestionCubit>()
                            .selectQuestionType,
                      ),

                      /// Description
                      Text(
                        "Block description",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 150,
                        child: TextFormField(
                          controller: _questionDescription,
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(color: theme.colorScheme.onSurface),
                          decoration: InputDecoration(
                            hintText: "Describe your block",
                            filled: true,
                            contentPadding: const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Access type
                      Text(
                        "Access type",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // TODO add answer
                      ElevatedButton(
                        onPressed: context
                            .read<CreateQuestionCubit>()
                            .addAnswer,
                        child: Text("Add answer"),
                      ),

                      // TODO answer buttons a, b, c, d
                      ...answerList(context, state),
                    ],
                  ),
                ),
        );
      },
    );
  }

  List<Widget> answerList(BuildContext context, CreateQuestionState state) {
    return state.answers.mapIndexed((i, e) {
      if (state.questionType == QuestionType.singleSelect) {
        return AnswerInputTile(
          index: i,
          onDismissed: (v) {
            context.read<CreateQuestionCubit>().removeAnswer(i);
          },
          letter: e.letter ?? "",
        );
      }

      // if (state.questionType == QuestionType.multipleSelect) {
      //   return MultipleAnswerTile(
      //     index: i,
      //     letter: e.letter ?? "",
      //     onDismissed: (v) {
      //       context.read<CreateQuestionCubit>().removeAnswer(i);
      //     },
      //     isSelected: e.isCorrect,
      //     onChanged: (value) {
      //       context.read<CreateQuestionCubit>().selectItemFromMultipleAnswers(
      //         i,
      //         value,
      //       );
      //     },
      //   );
      // }

      return SizedBox.shrink();
    }).toList();
  }
}

/// ================= ANSWER INPUTS =================
class AnswerInputTile extends StatelessWidget {
  final int index;
  final ValueChanged<DismissDirection> onDismissed;
  final String letter;
  final TextEditingController? controller;
  final String hintText;

  const AnswerInputTile({
    super.key,
    required this.index,
    required this.onDismissed,
    required this.letter,
    this.controller,
    this.hintText = 'Answer',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final widget = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        tileColor: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: _LetterCircle(
          letter: letter,
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
        title: TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            isCollapsed: true,
          ),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
    if (index > 2) {
      return Dismissible(
        background: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        key: Key("$index"),
        onDismissed: onDismissed,
        child: widget,
      );
    }
    return widget;
  }
}

class _LetterCircle extends StatelessWidget {
  final String letter;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _LetterCircle({
    required this.letter,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Text(
        letter,
        style: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MultipleAnswerTile extends StatelessWidget {
  final int index;
  final String letter;
  final bool isSelected;
  final ValueChanged<DismissDirection> onDismissed;
  final ValueChanged<bool?> onChanged;
  final TextEditingController? controller;
  final String hintText;

  const MultipleAnswerTile({
    super.key,
    required this.index,
    required this.onDismissed,
    required this.letter,
    required this.isSelected,
    required this.onChanged,
    this.controller,
    this.hintText = 'Answer',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Dismissible(
      key: Key("$index"),
      onDismissed: onDismissed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          tileColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Checkbox(value: isSelected, onChanged: onChanged),
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              isCollapsed: true,
            ),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= DROPDOWN =================
class _DropdownItem {
  final int id;
  final String name;

  const _DropdownItem({required this.id, required this.name});
}

class _DropdownField extends StatelessWidget {
  final String label;
  final int? value;
  final String? hint;
  final bool enabled;
  final List<_DropdownItem> items;
  final ValueChanged<int?> onChanged;

  const _DropdownField({
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.hint,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),

          DropdownButtonFormField<int>(
            value: value,
            hint: hint != null ? Text(hint!) : null,
            onChanged: enabled ? onChanged : null,
            dropdownColor: scheme.surface,
            items: items
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e.id,
                    child: Text(
                      e.name,
                      style: TextStyle(color: scheme.onSurface),
                    ),
                  ),
                )
                .toList(),
            decoration: InputDecoration(
              filled: true,
              fillColor: scheme.surfaceVariant,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
