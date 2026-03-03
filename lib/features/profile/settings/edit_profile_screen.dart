import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/utils/app_mode_service.dart';
import 'package:testabd/core/utils/language_service.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/profile/settings/edit_profile_cubit.dart';
import 'package:testabd/features/profile/settings/edit_profile_state.dart';
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
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 24),
                Icon(
                  Icons.logout_rounded,
                  size: 56,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.logoutQuestion,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.logoutDescription,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(context.l10n.stayLoggedIn),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.error,
                          foregroundColor: theme.colorScheme.onError,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Text(context.l10n.logOut),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              context.l10n.editAndSettings,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 120, 16, 100),
            children: [
              const SizedBox(height: 16),

              // ── SECTIONS ──
              _Section(title: context.l10n.profileInformation),
              _PremiumTile(
                icon: Icons.person_outline_rounded,
                title: context.l10n.personalInformation,
                subtitle: context.l10n.updatePersonalInfoDescription,
                onTap: () => context.push(AppRouter.personalInfo),
              ),
              const SizedBox(height: 24),

              _Section(title: context.l10n.location),
              _PremiumTile(
                icon: Icons.location_on_outlined,
                title: context.l10n.regionalSettings,
                subtitle: context.l10n.regionalSettingsDescription,
                onTap: () => context.push(AppRouter.regionalInfo),
              ),

              const SizedBox(height: 24),

              _Section(title: context.l10n.privacy),
              _PremiumTile(
                icon: Icons.lock_outline_rounded,
                title: context.l10n.changePassword,
                subtitle: context.l10n.changePasswordDescription,
                onTap: () => context.push(AppRouter.changePassword),
              ),

              const SizedBox(height: 24),

              _Section(title: context.l10n.appPreferences),
              _PremiumTile(
                icon: Icons.palette_outlined,
                title: context.l10n.themeSettings,
                subtitle: context.l10n.themeSettingsDescription,
                onTap: locator<AppSettingsService>().toggleDarkAndLight,
                trailing: StreamBuilder<ThemeMode>(
                  stream: locator<AppSettingsService>().stream,
                  builder: (_, snapshot) => Icon(
                    snapshot.data == ThemeMode.light ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: const Color(0xFFE1306C),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _PremiumTile(
                icon: Icons.language_rounded,
                title: context.l10n.language,
                subtitle: context.l10n.languageDescription,
                onTap: () => showModalBottomSheet(
                  context: navigatorKey.currentState!.context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const LanguageBottomSheet(),
                ),
                trailing: StreamBuilder(
                  stream: locator<LanguageService>().stream,
                  builder: (context, snapshot) => CircleAvatar(
                    backgroundImage: AssetImage(snapshot.data?.getFlag() ?? ''),
                    radius: 14,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _Section(title: context.l10n.referral),
              _PremiumTile(
                icon: Icons.card_giftcard_rounded,
                title: context.l10n.referAndEarn,
                subtitle: context.l10n.referDescription,
                onTap: () => context.push(AppRouter.referrals),
              ),

              const SizedBox(height: 24),

              _Section(title: context.l10n.account),
              _PremiumTile(
                icon: Icons.logout_rounded,
                title: context.l10n.logout,
                subtitle: context.l10n.logoutDescription,
                onTap: () => showLogoutDialog(context),
                trailing: const Icon(Icons.logout_rounded, color: Colors.red),
                isDestructive: true,
              ),

              const SizedBox(height: 120),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM SECTION HEADER
// ─────────────────────────────────────────────────────────────
class _Section extends StatelessWidget {
  final String title;
  const _Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 10),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM SETTING TILE
// ─────────────────────────────────────────────────────────────
class _PremiumTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool isDestructive;

  const _PremiumTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
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
                color: isDestructive
                    ? Colors.red.withOpacity(0.1)
                    : const Color(0xFFE1306C).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isDestructive ? Colors.red : const Color(0xFFE1306C),
                size: 26,
              ),
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
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            trailing ?? const Icon(Icons.chevron_right_rounded, size: 28, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}