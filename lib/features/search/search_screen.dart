import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<UserConnectionModel> users = [
    UserConnectionModel(
      id: 1,
      username: 'john_doe',
      firstName: 'John',
      lastName: 'Doe',
      profileImage: 'https://i.pravatar.cc/150?img=1',
      isFollowing: false,
    ),
    UserConnectionModel(
      id: 2,
      username: 'sarah_dev',
      firstName: 'Sarah',
      lastName: 'Johnson',
      profileImage: 'https://i.pravatar.cc/150?img=2',
      isFollowing: false,
    ),
    UserConnectionModel(
      id: 3,
      username: 'alex_codes',
      firstName: 'Alex',
      lastName: 'Smith',
      profileImage: 'https://i.pravatar.cc/150?img=3',
      isFollowing: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// 🔎 Search Bar
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search users...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            /// 📋 Users List
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _UserTile(
                    onTap: () {},
                    onTapFollow: () {},
                    user: user,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  final UserConnectionModel user;
  final VoidCallback onTap;
  final VoidCallback onTapFollow;

  const _UserTile({
    super.key,
    required this.user,
    required this.onTap,
    required this.onTapFollow,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: EdgeInsetsDirectional.symmetric(
      //   vertical: 1,
      //   horizontal: 16
      // ),
      onTap: user.isLoading ? null : onTap,
      leading: ClipOval(
        child: CachedNetworkImage(
          width: 36,
          height: 36,
          imageUrl: user.profileImage ?? '',
          fit: BoxFit.cover,
          placeholder: (_, __) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
          errorWidget: (_, __, ___) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
        ),
      ),
      title: Text(
        user.username,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        capitalize(user.firstName),
        style: TextStyle(color: Colors.grey),
      ),
      trailing: SizedBox(
        height: 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: user.isFollowing
                ? Theme.of(context).colorScheme.onSurface.withAlpha(150)
                : Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: user.isLoading ? null : onTapFollow,
          child: user.isLoading
              ? SizedBox(width: 16, height: 16, child: const ProgressView())
              : Text(
                  user.isFollowing
                      ? context.l10n.followed
                      : context.l10n.follow,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
