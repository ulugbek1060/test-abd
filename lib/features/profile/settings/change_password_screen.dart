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
      BlocProvider(create: (_) => locator<ChangePswdCubit>(), child: _View());
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

  bool _isOldPswdEnabled = false;
  bool _isNewPswdEnabled = true;
  bool _isConfirmPswdEnabled = true;

  @override
  void initState() {
    _currentPasswordTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePswdCubit, ChangePswdState>(
      listener: (_, state) {
        if (state.isSuccess) {
          _currentPasswordTextController.text = "";
          _passwordTextController.text = "";
          _confirmPasswordTextController.text = "";
        }
      },
      builder: (context, state) {
        return Scaffold(
          // 🔽 APPBAR
          appBar: AppBar(
            elevation: 0,
            title: const Text("Profilni tahrirlash"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: context.read<ChangePswdCubit>().toggleEditMode,
                icon: Icon(state.isEditModel ? Icons.close : Icons.edit),
              ),
            ],
          ),

          // 🔽 BOTTOM NAVIGATION BAR
          bottomNavigationBar: !state.isEditModel
              ? null
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ChangePswdCubit>().changePassword(
                            oldPswd: _currentPasswordTextController.text,
                            newPswd: _passwordTextController.text,
                            confirmPswd: _confirmPasswordTextController.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "O‘zgarishlarni saqlash",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

          // 🔽 SCROLLABLE BODY
          body: state.isLoading
              ? ProgressView()
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Header(),
                      const SizedBox(height: 24),

                      _InputField(
                        label: "Current Password",
                        hint: "Enter current password",
                        controller: _currentPasswordTextController,
                        suffixIcon: _isOldPswdEnabled
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: _isOldPswdEnabled,

                        togglePasswordVisibility: () {
                          setState(() {
                            _isOldPswdEnabled = !_isOldPswdEnabled;
                          });
                        },
                        enabled: state.isEditModel,
                      ),

                      _InputField(
                        label: "New Password",
                        hint: "Enter new password",
                        controller: _passwordTextController,
                        obscureText: _isNewPswdEnabled,
                        enabled: state.isEditModel,
                        suffixIcon: _isNewPswdEnabled
                            ? Icons.visibility
                            : Icons.visibility_off,
                        togglePasswordVisibility: () {
                          setState(() {
                            _isNewPswdEnabled = !_isNewPswdEnabled;
                          });
                        },
                      ),

                      _InputField(
                        label: "Confirm Password",
                        hint: "Enter confirm password",
                        controller: _confirmPasswordTextController,
                        suffixIcon: _isConfirmPswdEnabled
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: _isConfirmPswdEnabled,
                        togglePasswordVisibility: () {
                          setState(() {
                            _isConfirmPswdEnabled = !_isConfirmPswdEnabled;
                          });
                        },
                        enabled: state.isEditModel,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),

        SizedBox(height: 6),

        Text("Change your password", style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool enabled;
  final bool obscureText;
  final int maxLines;
  final IconData? suffixIcon;
  final VoidCallback? togglePasswordVisibility;

  const _InputField({
    required this.controller,
    required this.label,
    this.hint,
    this.enabled = true,
    this.obscureText = true,
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
            obscureText: obscureText,
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
