import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testabd/core/theme/app_images.dart'; // assuming you have this
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  // For demo — in real app use controller + search logic
  final List<UserConnectionModel> _users = [
    UserConnectionModel(
      id: 1,
      username: 'john_doe',
      firstName: 'John',
      lastName: 'Doe',
      profileImage: 'https://i.pravatar.cc/150?img=68',
      isFollowing: false,
    ),
    UserConnectionModel(
      id: 2,
      username: 'sarah_ui',
      firstName: 'Sarah',
      lastName: 'Wilson',
      profileImage: 'https://i.pravatar.cc/150?img=44',
      isFollowing: true,
    ),
    UserConnectionModel(
      id: 3,
      username: 'mike_codes',
      firstName: 'Mike',
      lastName: 'Chen',
      profileImage: 'https://i.pravatar.cc/150?img=33',
      isFollowing: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            // hintText: context.l10n.searchUsers,
            hintText: "searchUsers",
            hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: colorScheme.onSurfaceVariant,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _users.isEmpty
              ? _buildEmptyState(context)
              : SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  sliver: SliverList.separated(
                    itemCount: _users.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),

                    itemBuilder: (context, index) {
                      return _UserTileModern(
                        user: _users[index],
                        onTap: () {
                          // Navigate to profile
                        },
                        onFollowToggle: () {
                          // Toggle follow logic
                          setState(() {
                            _users[index] = _users[index].copyWith(
                              isFollowing: !_users[index].isFollowing,
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              // context.l10n.noResultsFound,
              "noResultsFound",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              // context.l10n.tryDifferentSearchTerm,
              "tryDifferentSearchTerm",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserTileModern extends StatelessWidget {
  final UserConnectionModel user;
  final VoidCallback onTap;
  final VoidCallback onFollowToggle;

  const _UserTileModern({
    required this.user,
    required this.onTap,
    required this.onFollowToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: user.isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Avatar
            ClipOval(
              child: CachedNetworkImage(
                width: 56,
                height: 56,
                imageUrl: user.profileImage ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: colorScheme.surfaceVariant,
                  child: const Icon(Icons.person),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 16),

            // Name & Username
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.username,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // if (true) ...[
                      //   const SizedBox(width: 4),
                      //   Icon(
                      //     Icons.verified,
                      //     color: Colors.blue,
                      //     size: 18,
                      //   ),
                      // ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${capitalize(user.firstName)} ${capitalize(user.lastName ?? '')}'
                        .trim(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Follow Button
            const SizedBox(width: 12),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 280),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: _FollowButton(
                key: ValueKey(user.isFollowing),
                isFollowing: user.isFollowing,
                isLoading: user.isLoading,
                onPressed: user.isLoading ? null : onFollowToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  final bool isFollowing;
  final bool isLoading;
  final VoidCallback? onPressed;

  const _FollowButton({
    super.key,
    required this.isFollowing,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 36,
      child: isLoading
          ? const Center(
              child: SizedBox.square(
                dimension: 20,
                child: ProgressView(strokeWidth: 2.4),
              ),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isFollowing
                      ? theme.colorScheme.outline
                      : theme.colorScheme.primary,
                ),
                backgroundColor: isFollowing ? null : theme.colorScheme.primary,
                foregroundColor: isFollowing
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                minimumSize: const Size(96, 36),
              ),
              child: Text(
                isFollowing ? context.l10n.following : context.l10n.follow,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}
