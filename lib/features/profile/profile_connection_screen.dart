import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/features/profile/profile_connection_cubit.dart';
import 'package:testabd/features/profile/profile_connection_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class ProfileConnectionScreen extends StatelessWidget {
  final ConnectionsEnum connectionType;

  const ProfileConnectionScreen({super.key, required this.connectionType});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<ProfileConnectionCubit>()..load(),
    child: _View(connectionType: connectionType),
  );
}

class _View extends StatelessWidget {
  final ConnectionsEnum connectionType;

  const _View({required this.connectionType});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      initialIndex: connectionType == ConnectionsEnum.following ? 1 : 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            connectionType == ConnectionsEnum.followers
                ? context.l10n.followers
                : context.l10n.following,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: TabBar(
              labelColor: scheme.onSurface,
              unselectedLabelColor: scheme.onSurface.withOpacity(0.6),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.5,
              ),
              indicatorColor: scheme.primary,
              indicatorWeight: 3,
              tabs: [
                Tab(text: context.l10n.followers),
                Tab(text: context.l10n.following),
              ],
            ),
          ),
        ),
        body: BlocBuilder<ProfileConnectionCubit, ProfileConnectionState>(
          builder: (context, state) {
            if (state.isLoading &&
                state.connections.followers.isEmpty &&
                state.connections.following.isEmpty) {
              return const ProgressView();
            }
            return TabBarView(
              children: [
                _ConnectionsList(
                  users: state.connections.followers,
                  emptyMessage: "Hali hech kim sizni kuzatmayapti",
                ),
                _ConnectionsList(
                  users: state.connections.following,
                  emptyMessage: "Hali hech kimni kuzatmaysiz",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     COMPACT MODERN USER TILE
// ─────────────────────────────────────────────────────────────
class _ConnectionsList extends StatelessWidget {
  final List<UserConnectionModel> users;
  final String emptyMessage;

  const _ConnectionsList({
    super.key,
    required this.users,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileConnectionCubit>();

    if (users.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline_rounded,
              size: 72,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              emptyMessage,
              style: const TextStyle(fontSize: 16.5, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: cubit.refresh,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        itemCount: users.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final user = users[index];
          return _CompactUserTile(
            user: user,
            onTap: () =>
                context.push(AppRouter.userProfileWithUsername(user.username)),
            onFollowTap: () => cubit.onFollowUser(user.id),
          );
        },
      ),
    );
  }
}

class _CompactUserTile extends StatelessWidget {
  final UserConnectionModel user;
  final VoidCallback onTap;
  final VoidCallback onFollowTap;

  const _CompactUserTile({
    super.key,
    required this.user,
    required this.onTap,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isFollowing = user.isFollowing;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Smaller Avatar
            ClipOval(
              child: CachedNetworkImage(
                width: 52,
                height: 52,
                imageUrl: user.profileImage ?? '',
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
                errorWidget: (_, __, ___) =>
                    Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700,
                      color: scheme.onSurface,
                    ),
                  ),
                  Text(
                    capitalize(user.firstName),
                    style: TextStyle(
                      fontSize: 14,
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Compact Follow Button
            SizedBox(
              height: 34,
              child: ElevatedButton(
                onPressed: user.isLoading ? null : onFollowTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing
                      ? AppColors.onSurfaceColor(context)
                      : scheme.primary,
                  foregroundColor: isFollowing
                      ? scheme.onSurface
                      : scheme.onPrimary,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: user.isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: ProgressView(),
                      )
                    : Text(
                        isFollowing
                            ? context.l10n.followed
                            : context.l10n.follow,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
