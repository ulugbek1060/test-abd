import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/home/notifications_cubit.dart';
import 'package:testabd/features/home/notifications_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<NotificationsCubit>()..fetchData(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF0F0F0F),
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text(context.l10n.notifications),
            centerTitle: true,
          ),
          body: state.isLoading
              ? ProgressView()
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: state.notifications.length,
                  separatorBuilder: (_, __) =>
                      const Divider(color: Color(0xFF1E1E1E), height: 1),
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return NotificationItem(
                      message: notification.message ?? "",
                      time: notification.time,
                    );
                  },
                ),
        );
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String message;
  final String time;

  const NotificationItem({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /// Name + Message
      title: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),

      /// Time
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          time,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),

      /// Coin Badge
      // trailing: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //   decoration: BoxDecoration(
      //     color: Colors.amber.withOpacity(0.15),
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       const Icon(Icons.monetization_on, color: Colors.amber, size: 18),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
