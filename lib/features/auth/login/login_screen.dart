import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/theme/app_size.dart';
import 'package:testabd/core/utils/app_assets.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/auth/login/login_cubit.dart';
import 'package:testabd/router/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (_) => locator<LoginCubit>(), child: const _View());
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0F),
              Color(0xFF1F0B3A),
              Color(0xFF2A0F4D),
            ],
          ),
        ),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) context.go(AppRouter.home);
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!), backgroundColor: Colors.red.shade400),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo & Welcome
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.indigoAccent.withOpacity(0.3), width: 6),
                            ),
                            child: Image.asset(AppImages.logo, width: 110),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Xush kelibsiz!",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "TestAbd'ga qo'shiling",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 48),

                      // Elevated Card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 40,
                              offset: const Offset(0, 20),
                            ),
                            BoxShadow(
                              color: Colors.indigo.withOpacity(0.15),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Username
                            _ModernTextField(
                              hintText: "Foydalanuvchi nomi",
                              icon: Icons.person_outline_rounded,
                              onChanged: cubit.onUsernameChanged,
                            ),
                            const SizedBox(height: 20),

                            // Password
                            _ModernTextField(
                              hintText: "Parol",
                              icon: Icons.lock_outline_rounded,
                              obscureText: !state.isPasswordVisible,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white70,
                                ),
                                onPressed: cubit.togglePasswordVisibility,
                              ),
                              onChanged: cubit.onPasswordChanged,
                            ),

                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: state.isLoading ? null : () => context.push(AppRouter.forgotPswd),
                                child: Text(
                                  "Parolni unutdingizmi?",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.indigoAccent,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Login Button
                            SizedBox(
                              height: 62,
                              child: ElevatedButton(
                                onPressed: state.isLoading ? null : cubit.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  elevation: 0,
                                ).copyWith(
                                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: state.isLoading
                                        ? const ProgressView()
                                        : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Kirish",
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 28),

                            // Register link
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "Hisobingiz yo'qmi? ",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                                  children: [
                                    TextSpan(
                                      text: "Ro'yxatdan o'tish",
                                      style: const TextStyle(
                                        color: Colors.indigoAccent,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          if (!state.isLoading) context.push(AppRouter.register);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Terms
                      Text.rich(
                        TextSpan(
                          text: "Kirish orqali siz bizning ",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                          children: const [
                            TextSpan(text: "Foydalanish shartlari ", style: TextStyle(color: Colors.indigoAccent)),
                            TextSpan(text: "va "),
                            TextSpan(text: "Maxfiylik siyosatiga", style: TextStyle(color: Colors.indigoAccent)),
                            TextSpan(text: " rozilik bildirasiz"),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Reusable Modern TextField
class _ModernTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;

  const _ModernTextField({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 17),
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.45)),
        prefixIcon: Icon(icon, color: Colors.white70, size: 26),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withOpacity(0.07),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.12), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF818CF8), width: 2),
        ),
      ),
    );
  }
}