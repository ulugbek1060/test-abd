import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/features/users/user_connection_cubit.dart';
import 'package:testabd/features/users/user_connection_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class UserConnectionScreen extends StatelessWidget {
  final int userId;
  final ConnectionsEnum connectionType;

  const UserConnectionScreen({
    super.key,
    required this.userId,
    required this.connectionType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<UserConnectionCubit>(param1: userId)..load(),
      child: _View(userId: userId, connectionType: connectionType),
    );
  }
}

class _View extends StatefulWidget {
  final int userId;
  final ConnectionsEnum connectionType;

  const _View({required this.userId, required this.connectionType});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late PageStorageKey _followersPageKey;
  late PageStorageKey _followingPageKey;

  @override
  void initState() {
    _followersPageKey = PageStorageKey('followersPageKey');
    _followingPageKey = PageStorageKey('followingPageKey');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.connectionType == ConnectionsEnum.following ? 1 : 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Connections'),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            labelColor: Theme.of(context).colorScheme.onSurface,
            tabs: [
              Tab(text: context.l10n.followers),
              Tab(text: context.l10n.following),
            ],
          ),
        ),
        body: BlocBuilder<UserConnectionCubit, UserConnectionState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: ProgressView());
            }
            return TabBarView(
              children: [
                _ConnectionsList(
                  key: _followersPageKey,
                  users: state.connections.followers,
                ),
                _ConnectionsList(
                  key: _followingPageKey,
                  users: state.connections.following,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ConnectionsList extends StatelessWidget {
  final List<UserConnectionModel> users;

  const _ConnectionsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserConnectionCubit>();
    return RefreshIndicator(
      onRefresh: cubit.refresh,
      color: Theme.of(context).colorScheme.secondary,
      child: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final user = users[index];
          return UserTile(
            isSuperUser: user.isMe,
            user: user,
            onTap: () =>
                context.push(AppRouter.userProfileWithUsername(user.username)),
            onTapFollow: () => cubit.onFollowUser(user.id),
          );
        },
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final UserConnectionModel user;
  final bool isSuperUser;
  final VoidCallback onTap;
  final VoidCallback onTapFollow;

  const UserTile({
    super.key,
    required this.user,
    required this.onTap,
    required this.isSuperUser,
    required this.onTapFollow,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      trailing: isSuperUser
          ? null
          : SizedBox(
              height: 32,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: user.isFollowing
                      ? Theme.of(context).colorScheme.surface
                      : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: user.isLoading ? null : onTapFollow,
                child: user.isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: const ProgressView(),
                      )
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
