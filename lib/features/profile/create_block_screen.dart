import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/features/profile/create_block_cubit.dart';
import 'package:testabd/features/profile/create_block_state.dart';

class CreateBlockScreen extends StatelessWidget {
  final int? blockId;

  const CreateBlockScreen({super.key, this.blockId});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<CreateBlockCubit>(param1: blockId),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _blockTitleController;
  late final TextEditingController _blockDescriptionController;
  late final ScrollController _scrollController;

  double _scrollOffset = 0.0;

  @override
  void initState() {
    _blockTitleController = TextEditingController();
    _blockDescriptionController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollChanged);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    _blockTitleController.dispose();
    _blockDescriptionController.dispose();
    super.dispose();
  }

  void _onScrollChanged() {
    if (!_scrollController.hasClients) return;

    final double offset = _scrollController.offset;

    // Calculate what opacity WOULD be
    const double threshold = 180.0;
    final double newOpacity = (offset / threshold).clamp(0.0, 1.0);
    final double currentOpacity = (_scrollOffset / threshold).clamp(0.0, 1.0);

    // ONLY update if:
    // 1. Opacity changes by more than 3% (eliminates tiny fluctuations)
    // 2. User is returning to top (special handling for bounce/overscroll)
    // 3. User is near bottom
    if ((newOpacity - currentOpacity).abs() > 0.03 ||
        (offset < 15 && _scrollOffset > 20) || // returning to top
        (offset > threshold - 20 && _scrollOffset < threshold - 40)) {
      setState(() {
        _scrollOffset = offset;
      });
    }
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) {
      return Colors.transparent;
    }

    const double threshold = 180.0;

    // Force fully transparent when very close to top (no edge flicker)
    if (_scrollOffset < 12) {
      return Colors.transparent;
    }

    final double opacity = (_scrollOffset / threshold).clamp(0.0, 1.0);

    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  // Color _getAppBarForeground() {
  //   if (!_scrollController.hasClients) return Colors.white;
  //   const double threshold = 160.0;
  //   final double t = (_scrollOffset / threshold).clamp(0.0, 1.0);
  //   return Color.lerp(
  //     Colors.white,
  //     Theme.of(context).colorScheme.onSurface,
  //     t,
  //   )!;
  // }

  double get _elevation => _scrollOffset > 80 ? 4.0 : 0.0;

  @override
  Widget build(BuildContext context) {
    final isEdit = context.read<CreateBlockCubit>().blockId != null;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _getAppBarBackground(),
        // elevation: _elevation,
        // foregroundColor: Colors.white,
        title: Text(
          isEdit ? "Edit Block" : "Create New Block",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 21,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CreateBlockCubit, CreateBlockState>(
        builder: (context, state) {
          final block = state.block;

          // Sync controllers when state changes (edit mode)
          if (block != null) {
            _blockTitleController.text = block.title ?? "";
            _blockDescriptionController.text = block.description ?? "";
          }

          return state.isLoading
              ? const ProgressView()
              : RefreshIndicator(
                  onRefresh: context.read<CreateBlockCubit>().refresh,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    // physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20, 120, 20, 140),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Premium header hint
                        Container(
                          padding: const EdgeInsets.all(20),
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
                              Icon(
                                Icons.create_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  "Build something amazing",
                                  style: TextStyle(
                                    fontSize: 22,
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

                        // Title
                        _ModernLabel("Block Title"),
                        const SizedBox(height: 10),
                        _ModernTextField(
                          controller: _blockTitleController,
                          hint: "Give your block a catchy name",
                          maxLength: 80,
                        ),

                        const SizedBox(height: 28),

                        // Description
                        _ModernLabel("Description"),
                        const SizedBox(height: 10),
                        _ModernTextField(
                          controller: _blockDescriptionController,
                          hint: "What is this block about? (optional)",
                          maxLines: 6,
                          minLines: 4,
                        ),

                        const SizedBox(height: 28),

                        // Category
                        _ModernLabel("Category"),
                        const SizedBox(height: 10),
                        _DropdownField(
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

                        const SizedBox(height: 32),

                        // Access Type - Premium cards
                        _ModernLabel("Who can see this block?"),
                        const SizedBox(height: 12),
                        _AccessTypeSelector(
                          selectedType: state.selectedAccessType,
                          onChanged: (v) => context
                              .read<CreateBlockCubit>()
                              .selectAccessType(v),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<CreateBlockCubit>().submit(
          title: _blockTitleController.text,
          description: _blockDescriptionController.text,
        ),
        label: const Text(
          "Save Block",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        icon: const Icon(Icons.check_rounded, size: 28),
        backgroundColor: const Color(0xFFE1306C),
        foregroundColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN LABEL
// ─────────────────────────────────────────────────────────────
class _ModernLabel extends StatelessWidget {
  final String text;

  const _ModernLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 15.5,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.onSurface,
      letterSpacing: 0.3,
    ),
  );
}

// ─────────────────────────────────────────────────────────────
//                     MODERN TEXT FIELD
// ─────────────────────────────────────────────────────────────
class _ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  const _ModernTextField({
    required this.controller,
    required this.hint,
    this.maxLines,
    this.minLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      maxLength: maxLength,
      style: TextStyle(
        fontSize: 17,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        counterStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM ACCESS SELECTOR
// ─────────────────────────────────────────────────────────────
class _AccessTypeSelector extends StatelessWidget {
  final AccessType? selectedType;
  final ValueChanged<AccessType?> onChanged;

  const _AccessTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AccessCard(
          type: AccessType.public,
          icon: Icons.public_rounded,
          title: "Public",
          subtitle: "Anyone can find and take this block",
          isSelected: selectedType == AccessType.public,
          onTap: () => onChanged(AccessType.public),
        ),
        const SizedBox(height: 12),
        _AccessCard(
          type: AccessType.unlisted,
          icon: Icons.link_rounded,
          title: "Unlisted",
          subtitle: "Only people with the link can access",
          isSelected: selectedType == AccessType.unlisted,
          onTap: () => onChanged(AccessType.unlisted),
        ),
        const SizedBox(height: 12),
        _AccessCard(
          type: AccessType.private,
          icon: Icons.lock_rounded,
          title: "Private",
          subtitle: "Only you can access this block",
          isSelected: selectedType == AccessType.private,
          onTap: () => onChanged(AccessType.private),
        ),
      ],
    );
  }
}

class _AccessCard extends StatelessWidget {
  final AccessType type;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _AccessCard({
    required this.type,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFFE1306C) : Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
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
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            Radio<AccessType>(
              value: type,
              groupValue: isSelected ? type : null,
              onChanged: (_) => onTap(),
              activeColor: const Color(0xFFE1306C),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     DROPDOWN (slightly enhanced)
// ─────────────────────────────────────────────────────────────
class _DropdownItem {
  final int id;
  final String name;

  const _DropdownItem({required this.id, required this.name});
}

class _DropdownField extends StatelessWidget {
  final int? value;
  final List<_DropdownItem> items;
  final ValueChanged<int?> onChanged;

  const _DropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: value,
      onChanged: onChanged,
      dropdownColor: Theme.of(context).colorScheme.surface,
      icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 28),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
      items: items
          .map(
            (e) => DropdownMenuItem<int>(
              value: e.id,
              child: Text(
                e.name,
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
