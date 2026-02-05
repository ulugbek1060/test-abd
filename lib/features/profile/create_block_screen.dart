import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/create_block_cubit.dart';

class CreateBlockScreen extends StatelessWidget {
  const CreateBlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<CreateBlockCubit>(),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _questionController;
  late final TextEditingController _answerController;
  late final TextEditingController _explanationController;
  late final TextEditingController _topicController;

  @override
  void initState() {
    _questionController = TextEditingController();
    _answerController = TextEditingController();
    _explanationController = TextEditingController();
    _topicController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Question')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          children: [
            _DropdownField(
              label: "Settlement",
              hint: "Settlementni tanlang",
              // enabled: state.isEditable,
              // value: settlementState.selected?.id,
              // isLoading: settlementState.isLoading,
              items: [
                _DropdownItem(id: 1, name: "Settlement 1"),
                _DropdownItem(id: 2, name: "Settlement 2"),
                _DropdownItem(id: 3, name: "Settlement 3"),
              ],
              onChanged: (value) {},
            ),

            _InputField(
              controller: _questionController,
              label: 'Question',
              hint: 'Enter question',
            ),
            _InputField(
              controller: _answerController,
              label: 'Answer',
              hint: 'Enter answer',
            ),
            _InputField(
              controller: _topicController,
              label: 'Answer',
              hint: 'Enter answer',
            ),
            _InputField(
              controller: _explanationController,
              label: 'Answer',
              hint: 'Enter answer',
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool enabled;
  final int maxLines;
  final IconData? suffixIcon;
  final VoidCallback? togglePasswordVisibility;

  const _InputField({
    required this.controller,
    required this.label,
    this.hint,
    this.enabled = true,
    this.suffixIcon,
    this.togglePasswordVisibility,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            enabled: enabled,
            maxLines: maxLines,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(suffixIcon),
                onPressed: togglePasswordVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownItem {
  final int? id;
  final String name;

  _DropdownItem({required this.id, required this.name});
}

class _DropdownField extends StatelessWidget {
  final String label;
  final int? value;
  final String? hint;
  final bool enabled;
  final bool isLoading;
  final List<_DropdownItem> items;
  final ValueChanged<int?> onChanged;

  const _DropdownField({
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.isLoading = false,
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
          Text(label, style: TextStyle(color: scheme.onSurface)),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    initialValue: value,
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
                      enabled: enabled,
                      fillColor: scheme.surfaceVariant,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                if (isLoading) const SizedBox(width: 8),

                if (isLoading) const ProgressView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
