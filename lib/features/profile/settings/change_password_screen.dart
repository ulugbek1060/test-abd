import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/settings/change_pswd_cubit.dart';
import 'package:testabd/features/profile/settings/change_pswd_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => locator<ChangePswdCubit>(), child: const _View());
}

class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final TextEditingController _currentPasswordTextController;
  late final TextEditingController _passwordTextController;
  late final TextEditingController _confirmPasswordTextController;

  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    _currentPasswordTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _currentPasswordTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocConsumer<ChangePswdCubit, ChangePswdState>(
      listener: (_, state) {
        if (state.isSuccess) {
          _currentPasswordTextController.clear();
          _passwordTextController.clear();
          _confirmPasswordTextController.clear();
        }
      },
      builder: (context, state) {
        final isEditable = state.isEditModel;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _getAppBarBackground(),
            elevation: _scrollOffset > 80 ? 4 : 0,
            foregroundColor: _scrollOffset > 120 ? scheme.onSurface : Colors.white,
            title: const Text(
              "Parolni o‘zgartirish",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: context.read<ChangePswdCubit>().toggleEditMode,
                icon: Icon(
                  isEditable ? Icons.close_rounded : Icons.edit_rounded,
                  size: 26,
                ),
              ),
            ],
          ),
          body: state.isLoading
              ? const ProgressView()
              : SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(20, 140, 20, 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── PREMIUM GRADIENT HEADER ──
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
                  child: Row(
                    children: [
                      const Icon(Icons.lock_rounded, color: Colors.white, size: 36),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Parolni o‘zgartirish",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Hisobingizni xavfsiz saqlang",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const _ModernLabel("Joriy parol"),
                const SizedBox(height: 10),
                _ModernPasswordField(
                  controller: _currentPasswordTextController,
                  hint: "Joriy parolni kiriting",
                  obscureText: _obscureCurrent,
                  onToggle: () => setState(() => _obscureCurrent = !_obscureCurrent),
                  enabled: isEditable,
                ),

                const SizedBox(height: 24),
                const _ModernLabel("Yangi parol"),
                const SizedBox(height: 10),
                _ModernPasswordField(
                  controller: _passwordTextController,
                  hint: "Yangi parolni kiriting",
                  obscureText: _obscureNew,
                  onToggle: () => setState(() => _obscureNew = !_obscureNew),
                  enabled: isEditable,
                ),

                const SizedBox(height: 24),
                const _ModernLabel("Yangi parolni tasdiqlash"),
                const SizedBox(height: 10),
                _ModernPasswordField(
                  controller: _confirmPasswordTextController,
                  hint: "Yangi parolni qayta kiriting",
                  obscureText: _obscureConfirm,
                  onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                  enabled: isEditable,
                ),
              ],
            ),
          ),
          floatingActionButton: isEditable
              ? FloatingActionButton.extended(
            onPressed: () => context.read<ChangePswdCubit>().changePassword(
              oldPswd: _currentPasswordTextController.text,
              newPswd: _passwordTextController.text,
              confirmPswd: _confirmPasswordTextController.text,
            ),
            label: const Text(
              "O‘zgarishlarni saqlash",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            icon: const Icon(Icons.check_rounded, size: 28),
            backgroundColor: scheme.primary,
            foregroundColor: scheme.onPrimary,
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
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
      letterSpacing: 0.3,
      color: Theme.of(context).colorScheme.onSurface,
    ),
  );
}

// ─────────────────────────────────────────────────────────────
//                     MODERN PASSWORD FIELD
// ─────────────────────────────────────────────────────────────
class _ModernPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final VoidCallback onToggle;
  final bool enabled;

  const _ModernPasswordField({
    required this.controller,
    required this.hint,
    required this.obscureText,
    required this.onToggle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: scheme.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: scheme.primary, width: 2.5),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
            color: scheme.primary,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}