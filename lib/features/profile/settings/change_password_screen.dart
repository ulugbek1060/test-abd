import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/settings/change_pswd_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
          create: (_) => locator<ChangePswdCubit>(),
          child: _View()
      );
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

  @override
  void initState() {
    _currentPasswordTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔽 APPBAR
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profilni tahrirlash"),
        centerTitle: true,
      ),

      // 🔽 BOTTOM NAVIGATION BAR
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "O‘zgarishlarni saqlash",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),

      // 🔽 SCROLLABLE BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            const SizedBox(height: 24),
            _InputField(
              label: "Current password",
              hint: "current password",
              controller: _currentPasswordTextController,
              enabled: true,
            ),
            _InputField(
              label: "New Password",
              hint: "New Password",
              controller: _passwordTextController,
              enabled: true,
            ),
            _InputField(
              label: "Confirm Password",
              hint: "confirm password",
              controller: _confirmPasswordTextController,
              enabled: true,
            ),
          ],
        ),
      ),
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
  final int maxLines;

  const _InputField({
    required this.controller,
    required this.label,
    this.hint,
    this.enabled = true,
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
