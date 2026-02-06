import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/create_question_cubit.dart';
import 'package:testabd/features/profile/create_question_state.dart';

class CreateQuestionsScreen extends StatelessWidget {
  const CreateQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<CreateQuestionCubit>(),
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
    final size = MediaQuery.of(context).size;

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
              : Stack(
                  children: [
                    // Background Image
                    Image.network(
                      'https://picsum.photos/seed/$randomSeed/${size.width.toInt()}/${size.height.toInt()}',
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),

                    // Blur Layer
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                        child: Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.surface.withOpacity(0.5),
                        ),
                      ),
                    ),

                    SingleChildScrollView(
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

                          /// Category
                          _DropdownField(
                            label: "Category",
                            hint: "Select category",
                            value: 0,
                            items: const [
                              _DropdownItem(id: 0, name: "Category 1"),
                              _DropdownItem(id: 1, name: "Category 2"),
                              _DropdownItem(id: 2, name: "Category 3"),
                            ],
                            onChanged: (v) {},
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
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                              ),
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
                            onPressed: () {
                              context.read<CreateQuestionCubit>().addAnswer();
                            },
                            child: Text("Add answer"),
                          ),

                          // TODO answer buttons a, b, c, d
                          ...answerList(state),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  List<Widget> answerList(CreateQuestionState state) {
    return state.answers.map((e) => Text(e.letter ?? 'answer')).toList();
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
