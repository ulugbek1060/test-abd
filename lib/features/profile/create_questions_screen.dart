import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/create_question_cubit.dart';
import 'package:testabd/features/profile/create_question_state.dart';

class CreateQuestionsScreen extends StatelessWidget {
  final int? questionId;

  const CreateQuestionsScreen({super.key, this.questionId});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<CreateQuestionCubit>(param1: questionId),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _questionController;
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _questionController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _questionController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }
  }

  Color _appBarBg() {
    if (!_scrollController.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateQuestionCubit, CreateQuestionState>(
      builder: (context, state) {
        // Sync controller
        if (state.question?.questionText != null) {
          _questionController.text = state.question!.questionText!;
        }

        final canAddAnswer = state.questionType == QuestionType.singleSelect ||
            state.questionType == QuestionType.multipleSelect;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _appBarBg(),
            elevation: _scrollOffset > 80 ? 3 : 0,
            foregroundColor: _scrollOffset > 120
                ? Theme.of(context).colorScheme.onSurface
                : Colors.white,
            title: const Text(
              "Create Question",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
          ),
          body: state.isLoading
              ? const ProgressView()
              : SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Premium gradient header
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.quiz_rounded, color: Colors.white, size: 36),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Craft a perfect question",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Question text
                const _ModernLabel("Question"),
                const SizedBox(height: 10),
                _ModernTextField(
                  controller: _questionController,
                  hint: "Type your question here...",
                  maxLines: 5,
                  minLines: 3,
                ),

                const SizedBox(height: 28),

                // Category
                const _ModernLabel("Category"),
                const SizedBox(height: 10),
                _ModernDropdown(
                  value: state.selectedCategory?.id,
                  hint: "Select category",
                  items: state.categories
                      .map((e) => _DropdownItem(id: e.id ?? 0, name: e.title ?? ""))
                      .toList(),
                  onChanged: context.read<CreateQuestionCubit>().selectCategory,
                ),

                const SizedBox(height: 24),

                // Block
                const _ModernLabel("Block"),
                const SizedBox(height: 10),
                _ModernDropdown(
                  value: state.selectedBlock?.id,
                  hint: "Select block",
                  items: state.blocks
                      .map((e) => _DropdownItem(id: e.id ?? 0, name: e.title ?? ""))
                      .toList(),
                  onChanged: context.read<CreateQuestionCubit>().selectBlock,
                ),

                const SizedBox(height: 24),

                // Question Type
                const _ModernLabel("Question Type"),
                const SizedBox(height: 10),
                _ModernDropdown(
                  value: state.questionType?.index,
                  hint: "Select type",
                  items: QuestionType.values
                      .mapIndexed((i, e) => _DropdownItem(id: i, name: e.getName(context)))
                      .toList(),
                  onChanged: context.read<CreateQuestionCubit>().selectQuestionType,
                ),

                const SizedBox(height: 32),

                // Answers Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _ModernLabel("Answers"),
                    if (canAddAnswer)
                      ElevatedButton.icon(
                        onPressed: context.read<CreateQuestionCubit>().addAnswer,
                        icon: const Icon(Icons.add_rounded, size: 20),
                        label: const Text("Add Answer"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE1306C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 14),

                // Dynamic answer list
                ...answerList(context, state),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.read<CreateQuestionCubit>().submit(_questionController.text),
            label: const Text(
              "Save Question",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            icon: const Icon(Icons.check_rounded, size: 28),
            backgroundColor: const Color(0xFFE1306C),
            foregroundColor: Colors.white,
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  List<Widget> answerList(BuildContext context, CreateQuestionState state) {
    return state.answers.mapIndexed((index, answer) {
      final cubit = context.read<CreateQuestionCubit>();

      switch (state.questionType) {
        case QuestionType.singleSelect:
          return _SingleAnswerTile(
            text: answer.answerText ?? "",
            letter: answer.letter ?? "",
            isCorrect: answer.isCorrect,
            index: index,
            onChanged: (v) => cubit.onChangeAnswerByIndex(index, v),
            onSelect: () => cubit.onSelectItemFromSingleAnswer(index),
            onDismissed: (_) => cubit.removeAnswer(index),
          );

        case QuestionType.multipleSelect:
          return _MultipleAnswerTile(
            text: answer.answerText ?? "",
            letter: answer.letter ?? "",
            isCorrect: answer.isCorrect,
            index: index,
            onChanged: (v) => cubit.onChangeAnswerByIndex(index, v),
            onSelect: (v) => cubit.onSelectItemFromMultipleAnswers(index, v),
            onDismissed: (_) => cubit.removeAnswer(index),
          );

        case QuestionType.trueFalse:
          return _TrueFalseTile(
            isTrue: index == 0,
            isCorrect: answer.isCorrect,
            text: answer.answerText ?? (index == 0 ? "True" : "False"),
            onTap: () => cubit.onSelectItemFromSingleAnswer(index),
          );

        case QuestionType.textQuestion:
          return _TextAnswerTile(
            text: answer.answerText ?? "",
            onChanged: (v) => cubit.onChangeAnswerByIndex(index, v),
          );

        default:
          return const SizedBox();
      }
    }).toList();
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN REUSABLE WIDGETS
// ─────────────────────────────────────────────────────────────
class _ModernLabel extends StatelessWidget {
  final String text;
  const _ModernLabel(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      fontSize: 15.5,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
    ),
  );
}

class _ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final int? minLines;

  const _ModernTextField({
    required this.controller,
    required this.hint,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.5),
        ),
      ),
    );
  }
}

class _ModernDropdown extends StatelessWidget {
  final int? value;
  final String hint;
  final List<_DropdownItem> items;
  final ValueChanged<int?> onChanged;

  const _ModernDropdown({
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: value,
      hint: Text(hint, style: TextStyle(color: Colors.grey.shade500)),
      onChanged: onChanged,
      dropdownColor: Theme.of(context).colorScheme.surface,
      icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.5),
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem<int>(value: e.id, child: Text(e.name, style: const TextStyle(fontSize: 16.5))))
          .toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     BEAUTIFUL ANSWER TILES
// ─────────────────────────────────────────────────────────────
class _SingleAnswerTile extends StatelessWidget {
  final String text;
  final String letter;
  final bool isCorrect;
  final int index;
  final ValueChanged<String> onChanged;
  final VoidCallback onSelect;
  final ValueChanged<DismissDirection> onDismissed;

  const _SingleAnswerTile({
    required this.text,
    required this.letter,
    required this.isCorrect,
    required this.index,
    required this.onChanged,
    required this.onSelect,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isCorrect ? const Color(0xFF34C759) : Colors.transparent,
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onSelect,
            child: Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isCorrect ? const Color(0xFF34C759) : const Color(0xFFE1306C).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: isCorrect ? Colors.white : const Color(0xFFE1306C),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: TextEditingController()..text = text,
              onChanged: onChanged,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Answer option",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 16.5),
            ),
          ),
        ],
      ),
    );

    return index > 2
        ? Dismissible(
      key: Key("single_$index"),
      onDismissed: onDismissed,
      background: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: widget,
    )
        : widget;
  }
}

class _MultipleAnswerTile extends StatelessWidget {
  final String text;
  final String letter;
  final bool isCorrect;
  final int index;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool?> onSelect;
  final ValueChanged<DismissDirection> onDismissed;

  const _MultipleAnswerTile({
    required this.text,
    required this.letter,
    required this.isCorrect,
    required this.index,
    required this.onChanged,
    required this.onSelect,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isCorrect ? const Color(0xFF34C759) : Colors.transparent,
          width: 2.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: isCorrect,
              onChanged: onSelect,
              activeColor: const Color(0xFF34C759),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: TextEditingController()..text = text,
              onChanged: onChanged,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Answer option",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 16.5),
            ),
          ),
        ],
      ),
    );

    return index > 2
        ? Dismissible(
      key: Key("multi_$index"),
      onDismissed: onDismissed,
      background: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: widget,
    )
        : widget;
  }
}

class _TrueFalseTile extends StatelessWidget {
  final bool isTrue;
  final bool isCorrect;
  final String text;
  final VoidCallback onTap;

  const _TrueFalseTile({
    required this.isTrue,
    required this.isCorrect,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isCorrect ? const Color(0xFF34C759) : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
          color: isCorrect ? color.withOpacity(0.1) : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isTrue ? Icons.check_circle : Icons.cancel,
              size: 42,
              color: color,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            if (isCorrect) const Icon(Icons.star_rounded, color: Colors.amber, size: 32),
          ],
        ),
      ),
    );
  }
}

class _TextAnswerTile extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const _TextAnswerTile({required this.text, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: TextEditingController()..text = text,
        onChanged: onChanged,
        maxLines: 6,
        decoration: const InputDecoration(
          hintText: "Students will type their answer here...",
          border: InputBorder.none,
        ),
        style: const TextStyle(fontSize: 16.5),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     DROPDOWN ITEM
// ─────────────────────────────────────────────────────────────
class _DropdownItem {
  final int id;
  final String name;
  const _DropdownItem({required this.id, required this.name});
}