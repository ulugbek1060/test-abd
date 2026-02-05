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
  late final TextEditingController _bockTitleController;
  late final TextEditingController _blockDescriptionController;

  @override
  void initState() {
    _bockTitleController = TextEditingController();
    _blockDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Block')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InputField(
              controller: _bockTitleController,
              label: 'Question',
              hint: 'Enter question',
            ),

            Text("Block name", style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),


            SizedBox(
              height: 150,
              width: double.infinity,
              child: TextFormField(
                controller: _blockDescriptionController,
                expands: true,
                maxLines: null,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter block description",
                  filled: true,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            _DropdownField(
              label: "Category",
              hint: "Category tanlang",
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
            const SizedBox(height: 8),


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
