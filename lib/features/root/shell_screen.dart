import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/data/local_source/my_info_hive_service.dart';
import 'package:testabd/data/remote_source/account/ws_notifications_source.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/main.dart';

class ShellScreen extends StatefulWidget {
  final StatefulNavigationShell navShell;
  final List<Widget> children;

  const ShellScreen({
    super.key,
    required this.navShell,
    required this.children,
  });

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  late final WSNotificationsSource _notificationsSource;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    _notificationsSource = locator<WSNotificationsSource>();
    final userLocal = locator<MyInfoHiveService>();
    final userId = await userLocal.userStream.first;
    _notificationsSource.connectWebSocket(userId?.id ?? 0, (data) {
      locator<AppMessageHandler>().handleDialog(SuccessException('Test completed'));
    });
  }

  @override
  void dispose() {
    _notificationsSource.closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(
        index: widget.navShell.currentIndex,
        children: widget.children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurface.withAlpha(120),
        ),
        unselectedLabelStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 12,
        ),
        selectedIconTheme: IconThemeData(color: colorScheme.secondary),
        selectedLabelStyle: TextStyle(
          color: colorScheme.secondary,
          fontSize: 13,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: context.l10n.home,
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            activeIcon: Icon(Icons.search_rounded),
            label: context.l10n.search,
            tooltip: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ClipOval(
              child: SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(AppImages.logo),
              ),
            ),
            label: "",
            tooltip: 'TestAbd',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            activeIcon: Icon(Icons.local_library_rounded),
            label: context.l10n.library,
            tooltip: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: context.l10n.profile,
            tooltip: 'Profile',
          ),
        ],
        selectedItemColor: colorScheme.secondary,
        currentIndex: widget.navShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => widget.navShell.goBranch(index),
      ),
    );
  }
}
