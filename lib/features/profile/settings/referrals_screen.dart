import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/account/entities/referral_list_model.dart';
import 'package:testabd/features/profile/settings/referrals_cubit.dart';
import 'package:testabd/features/profile/settings/referrals_state.dart';

class ReferralsScreen extends StatelessWidget {
  const ReferralsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ReferralsCubit>()..fetchReferrals(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocBuilder<ReferralsCubit, ReferralsState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              "Referral Dasturi",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
          ),
          body: state.isLoading
              ? const ProgressView()
              : SingleChildScrollView(
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
                            const Icon(
                              Icons.card_giftcard_rounded,
                              color: Colors.white,
                              size: 42,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Referral Dasturi",
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      height: 1.1,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Do'stlaringizni taklif qiling va bonus oling!",
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.white.withOpacity(0.9),
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // ── STATS ROW ──
                      Row(
                        children: [
                          Expanded(
                            child: _ModernStatCard(
                              title: "Jami",
                              value: (state.referrals?.results.length ?? 0)
                                  .toString(),
                              gradient: const [
                                Color(0xFF3B82F6),
                                Color(0xFF9333EA),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: _ModernStatCard(
                              title: "Bu oy",
                              value: (state.referrals?.results.length ?? 0)
                                  .toString(),
                              gradient: const [
                                Color(0xFF22C55E),
                                Color(0xFF16A34A),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // ── SECTION TITLE ──
                      const _ModernLabel("Taklif qilingan foydalanuvchilar"),

                      const SizedBox(height: 14),

                      // ── REFERRAL LIST ──
                      if ((state.referrals?.results ?? []).isEmpty)
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 60),
                              Icon(
                                Icons.people_outline_rounded,
                                size: 80,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Hali hech kimni taklif qilmadingiz",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: scheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        ...(state.referrals?.results ?? []).map(
                          (user) => _ReferralItem(
                            username: user.referred?.username ?? '',
                            profileImage: user.referred?.profileImage ?? '',
                          ),
                        ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // TODO: Copy referral link / Share
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Referral link nusxalandi! 🎉")),
              );
            },
            label: const Text(
              "Do'stni taklif qilish",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            icon: const Icon(Icons.share_rounded, size: 26),
            backgroundColor: scheme.primary,
            foregroundColor: scheme.onPrimary,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
//                     MODERN STAT CARD
// ─────────────────────────────────────────────────────────────
class _ModernStatCard extends StatelessWidget {
  final String title;
  final String value;
  final List<Color> gradient;

  const _ModernStatCard({
    required this.title,
    required this.value,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN REFERRAL ITEM
// ─────────────────────────────────────────────────────────────
class _ReferralItem extends StatelessWidget {
  final String username;
  final String profileImage;

  const _ReferralItem({required this.username, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
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
          ClipOval(
            child: CachedNetworkImage(
              width: 56,
              height: 56,
              imageUrl: profileImage,
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
              errorWidget: (_, __, ___) =>
                  Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              username,
              style: TextStyle(
                fontSize: 17.5,
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: scheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "+100",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFFE1306C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
