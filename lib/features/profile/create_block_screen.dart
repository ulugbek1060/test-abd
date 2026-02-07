import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/features/profile/create_block_cubit.dart';
import 'package:testabd/features/profile/create_block_state.dart';

class CreateBlockScreen extends StatelessWidget {
  const CreateBlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<CreateBlockCubit>()..fetchCategories(),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _blockTitleController;
  late final TextEditingController _blockDescriptionController;
  int randomSeed = 0;

  @override
  void initState() {
    randomSeed = Random().nextInt(100);
    _blockTitleController = TextEditingController();
    _blockDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _blockTitleController.dispose();
    _blockDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

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
                context.read<CreateBlockCubit>().submit(
                  title: _blockTitleController.text,
                  description: _blockDescriptionController.text,
                );
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

      body: BlocConsumer<CreateBlockCubit, CreateBlockState>(
        listener: (_, state) {
          if (state.block != null) {
            _blockTitleController.clear();
            _blockDescriptionController.clear();
            randomSeed = Random().nextInt(100);
            context.read<CreateBlockCubit>().reset();
            context.read<CreateBlockCubit>().successMessage();
            // TODO: Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return state.isLoading
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

                    RefreshIndicator(
                      onRefresh: context.read<CreateBlockCubit>().refresh,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Block title',
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _blockTitleController,
                              enabled: true,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter block title',
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

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
                                controller: _blockDescriptionController,
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

                            /// Category
                            _DropdownField(
                              label: "Category",
                              hint: "Select category",
                              value: state.selectedCategory?.id,
                              items: state.categories
                                  .map(
                                    (e) => _DropdownItem(
                                      id: e.id ?? 0,
                                      name: e.title ?? "",
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) => context
                                  .read<CreateBlockCubit>()
                                  .selectCategory(v),
                            ),

                            const SizedBox(height: 8),

                            /// Access type
                            Text(
                              "Access type",
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),

                            _accessTile(
                              context: context,
                              value: AccessType.public,
                              groupValue: state.selectedAccessType,
                              title: "Public",
                              subtitle: "Anyone can find and take this block",
                              onChanged: (v) => context
                                  .read<CreateBlockCubit>()
                                  .selectAccessType(v),
                            ),

                            _accessTile(
                              context: context,
                              value: AccessType.unlisted,
                              groupValue: state.selectedAccessType,
                              title: "Unlisted",
                              subtitle: "Only people with the link can access",
                              onChanged: (v) => context
                                  .read<CreateBlockCubit>()
                                  .selectAccessType(v),
                            ),

                            _accessTile(
                              context: context,
                              value: AccessType.private,
                              groupValue: state.selectedAccessType,
                              title: "Private",
                              subtitle: "Only you can access this block",
                              onChanged: (v) => context
                                  .read<CreateBlockCubit>()
                                  .selectAccessType(v),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
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

/// ================= ACCESS TILE =================
Widget _accessTile({
  required BuildContext context,
  required AccessType value,
  required AccessType groupValue,
  required String title,
  required String subtitle,
  required ValueChanged<AccessType?> onChanged,
}) {
  return Card(
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: Theme.of(context).colorScheme.surface,
    child: RadioListTile<AccessType>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    ),
  );
}
