import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class ShellScreen extends StatelessWidget {
  final StatefulNavigationShell navShell;
  final List<Widget> children;

  const ShellScreen({
    super.key,
    required this.navShell,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: IndexedStack(index: navShell.currentIndex, children: children),
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
        currentIndex: navShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => navShell.goBranch(index),
      ),
    );
  }
}
