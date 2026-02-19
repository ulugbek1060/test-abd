import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:testabd/core/utils/app_mode_service.dart';
import 'package:testabd/core/utils/language_service.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/settings/edit_profile_cubit.dart';
import 'package:testabd/features/profile/settings/language_bottom_sheet.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<EditProfileCubit>(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  void showLogoutDialog(BuildContext context) {
    showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final theme = Theme.of(context);

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Drag Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const SizedBox(height: 20),

              /// Icon
              Icon(
                Icons.logout_rounded,
                size: 48,
                color: theme.colorScheme.error,
              ),

              const SizedBox(height: 12),

              /// Title
              Text(
                context.l10n.logoutQuestion,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              /// Message
              Text(
                context.l10n.logoutDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 28),

              /// Actions
              Row(
                children: [
                  /// Cancel / Stay
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(context.l10n.stayLoggedIn),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Logout
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                        foregroundColor: theme.colorScheme.onError,
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(context.l10n.logOut),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ).then((confirmed) {
      if (confirmed == true) {
        context.read<EditProfileCubit>().logout();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.editAndSettings),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // TelegramBotCard(),
          // SizedBox(height: 24),
          _Section(title: context.l10n.profileInformation),
          _ProfileTile(
            title: context.l10n.personalInformation,
            description: context.l10n.updatePersonalInfoDescription,
            onTap: () => context.push(AppRouter.personalInfo),
          ),

          const SizedBox(height: 24),

          _Section(title: context.l10n.location),
          _ProfileTile(
            title: context.l10n.regionalSettings,
            description: context.l10n.regionalSettingsDescription,
            onTap: () => context.push(AppRouter.regionalInfo),
          ),

          const SizedBox(height: 24),

          _Section(title: context.l10n.privacy),
          _ProfileTile(
            title: context.l10n.changePassword,
            description: context.l10n.changePasswordDescription,
            trailing: const Icon(Icons.lock),
            onTap: () => context.push(AppRouter.changePassword),
          ),

          const SizedBox(height: 24),

          _Section(title: context.l10n.appPreferences),
          _ProfileTile(
            title: context.l10n.themeSettings,
            description: context.l10n.themeSettingsDescription,
            onTap: locator<AppSettingsService>().toggleDarkAndLight,
            trailing: StreamBuilder(
              stream: locator<AppSettingsService>().stream,
              builder: (_, snapshot) {
                return snapshot.data == ThemeMode.light
                    ? const Icon(Icons.light_mode_rounded)
                    : const Icon(Icons.dark_mode_rounded);
              },
            ),
          ),
          const SizedBox(height: 16),
          _ProfileTile(
            title: context.l10n.language,
            description: context.l10n.languageDescription,
            onTap: () => showModalBottomSheet(
              context: navigatorKey.currentState!.context,
              backgroundColor: Colors.transparent,
              builder: (context) => const LanguageBottomSheet(),
            ),
            trailing: StreamBuilder(
              stream: locator<LanguageService>().stream,
              builder: (context, asyncSnapshot) => CircleAvatar(
                backgroundImage: AssetImage(
                  asyncSnapshot.data?.getFlag() ?? '',
                ),
                radius: 12,
              ),
            ),
          ),

          const SizedBox(height: 24),

          _Section(title: context.l10n.referral),
          _ProfileTile(
            title: context.l10n.referAndEarn,
            description: context.l10n.referDescription,
            onTap: () => context.push(AppRouter.referrals),
            trailing: const Icon(Icons.history),
          ),

          const SizedBox(height: 24),

          _Section(title: context.l10n.account),
          _ProfileTile(
            title: context.l10n.logout,
            description: context.l10n.logoutDescription,
            trailing: Icon(Icons.logout, color: Colors.red),
            onTap: () => showLogoutDialog(context),
          ),

          // 100
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;

  const _Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final String title;
  final String description;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.title,
    required this.description,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        description,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.grey),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

/// -------------------- Telegram card ----------------------
// class TelegramBotCard extends StatelessWidget {
//   const TelegramBotCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFF3B82F6), Color(0xFF9333EA), Color(0xFFEC4899)],
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 🔹 HEADER
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: const Icon(
//                   Icons.smart_toy,
//                   color: Colors.white,
//                   size: 28,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "🚀 Telegram Bot orqali boshqaring!",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       "Profil ma'lumotlaringizni yanada qulay boshqaring",
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔹 FEATURES BOX
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   "✨ Telegram botimizning afzalliklari:",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 _FeatureItem(icon: "🔥", text: "Tezkor profil yangilash"),
//                 _FeatureItem(
//                   icon: "📱",
//                   text: "Mobil qurilmada qulay foydalanish",
//                 ),
//                 _FeatureItem(icon: "🔔", text: "Real vaqtda bildirishnomalar"),
//                 _FeatureItem(icon: "⚡", text: "Bir necha sekundda sozlash"),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // 🔹 BUTTON
//           InkWell(
//             borderRadius: BorderRadius.circular(32),
//             onTap: () {
//               // TODO: open telegram link
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(32),
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.smart_toy, color: Color(0xFF2563EB)),
//                   SizedBox(width: 8),
//                   Text(
//                     "@TestAbdUzBot",
//                     style: TextStyle(
//                       color: Color(0xFF2563EB),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(Icons.open_in_new, color: Color(0xFF2563EB)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _FeatureItem extends StatelessWidget {
//   final String icon;
//   final String text;
//
//   const _FeatureItem({required this.icon, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         children: [
//           Text(icon, style: const TextStyle(fontSize: 18)),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(text, style: const TextStyle(color: Colors.white70)),
//           ),
//         ],
//       ),
//     );
//   }
// }
