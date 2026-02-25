import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/features/auth/forgotpswd/forgot_pswd_screen.dart';
import 'package:testabd/features/auth/login/login_screen.dart';
import 'package:testabd/features/auth/register/register_screen.dart';
import 'package:testabd/features/home/home_screen.dart';
import 'package:testabd/features/home/leaderboard_screen.dart';
import 'package:testabd/features/home/notifications_screen.dart';
import 'package:testabd/features/profile/profile_screen.dart';
import 'package:testabd/features/users/user_block_detail_screen.dart';
import 'package:testabd/features/init/init_screen.dart';
import 'package:testabd/features/library/library_screen.dart';
import 'package:testabd/features/profile/my_block_detail_screen.dart';
import 'package:testabd/features/profile/bookmark_questions_screen.dart';
import 'package:testabd/features/profile/create_block_screen.dart';
import 'package:testabd/features/profile/create_questions_screen.dart';
import 'package:testabd/features/profile/my_question_detail_screen.dart';
import 'package:testabd/features/profile/profile_connection_screen.dart';
import 'package:testabd/features/profile/settings/change_password_screen.dart';
import 'package:testabd/features/profile/settings/edit_profile_screen.dart';
import 'package:testabd/features/profile/settings/personal_info_screen.dart';
import 'package:testabd/features/profile/settings/referrals_screen.dart';
import 'package:testabd/features/profile/settings/regional_settings_screen.dart';
import 'package:testabd/features/root/shell_screen.dart';
import 'package:testabd/features/search/search_screen.dart';
import 'package:testabd/features/testabd/test_screen.dart';
import 'package:testabd/features/users/user_connection_screen.dart';
import 'package:testabd/features/users/user_profile_screen.dart';
import 'package:testabd/features/users/user_question_detail_screen.dart';

abstract class AppRouter {
  static const initial = '/';
  static const login = '/login';
  static const forgotPswd = '/forgot_password';
  static const register = '/register';
  static const home = '/home';
  static const search = '/search';
  static const testMain = '/test_main';
  static const library = '/library';
  static const profile = '/profile';
  static const notifications = '/notifications';
  static const userProfile = '/users/:username';
  static const leaderboard = '/leaderboard';
  static const editProfile = '/edit_profile';
  static const bookmarkQuestions = '/bookmark_questions';
  static const referrals = '/referrals';
  static const personalInfo = '/personal_info';
  static const regionalInfo = '/regional_info';
  static const changePassword = '/change_password';

  static const createQuestions = '/create_question/:question_id';
  static String createQuestionWithArgs(int? questionId) =>
      '/create_question/$questionId';

  static const createBlock = '/create_block/:block_id';
  static String createBlockWithArg(int? blockId) => '/create_block/$blockId';

  static const blockDetail = '/block_detail/:block_id';
  static String blockDetailWithBlockId(int blockId) => '/block_detail/$blockId';

  static const userBlockDetail = '/user_block_detail/:block_id';
  static String userBlockDetailWithBlockId(int blockId) =>
      '/user_block_detail/$blockId';

  static const userQuestionDetail = '/user_question_detail/:question_id';
  static String userQuestionDetailWithBlockId(int? questionId) =>
      '/user_question_detail/$questionId';

  static const myQuestionDetail = '/my_question_detail/:question_id';
  static String myQuestionDetailWithArgs(int? questionId) =>
      '/my_question_detail/$questionId';

  static String userProfileWithUsername(String username) => '/users/$username';
  static const userConnection = '/user_connection/:user_id/:connection_type';

  static String userConnectionWithUserId({
    required int userId,
    required String connectionType,
  }) => '/user_connection/$userId/$connectionType';

  static const profileConnection = '/profile_connection/:connection_type';

  static String profileConnectionWithUserId({required String connectionType}) =>
      '/profile_connection/$connectionType';
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: AppRouter.initial,
  routes: [
    GoRoute(
      path: AppRouter.initial,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const InitialScreen()),
    ),
    GoRoute(
      path: AppRouter.login,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const LoginScreen()),
    ),
    GoRoute(
      path: AppRouter.forgotPswd,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const ForgotPswdScreen()),
    ),
    GoRoute(
      path: AppRouter.register,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const RegisterScreen()),
    ),
    GoRoute(
      path: AppRouter.notifications,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const NotificationsScreen()),
    ),
    GoRoute(
      path: AppRouter.userProfile,
      pageBuilder: (context, state) {
        final username = state.pathParameters['username']!;
        return CupertinoPage(child: UserProfileScreen(username: username));
      },
    ),
    GoRoute(
      path: AppRouter.userConnection,
      pageBuilder: (context, state) {
        final userId = state.pathParameters['user_id']!;
        final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(
          child: UserConnectionScreen(
            userId: int.tryParse(userId) ?? -1,
            connectionType: ConnectionsEnum.fromString(connectionType),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRouter.myQuestionDetail,
      pageBuilder: (context, state) {
        final questionId = state.pathParameters['question_id'];
        return CupertinoPage(
          child: MyQuestionDetailScreen(
            questionId: int.tryParse(questionId ?? ""),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRouter.userQuestionDetail,
      pageBuilder: (context, state) {
        final questionId = state.pathParameters['question_id'];
        return CupertinoPage(
          child: UserQuestionDetailScreen(
            questionId: int.tryParse(questionId ?? ""),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRouter.leaderboard,
      pageBuilder: (context, state) {
        return CupertinoPage(child: LeaderboardScreen());
      },
    ),
    GoRoute(
      path: AppRouter.editProfile,
      pageBuilder: (context, state) {
        return CupertinoPage(child: EditProfileScreen());
      },
    ),
    GoRoute(
      path: AppRouter.bookmarkQuestions,
      pageBuilder: (context, state) {
        return CupertinoPage(child: BookmarkQuestionsScreen());
      },
    ),
    GoRoute(
      path: AppRouter.blockDetail,
      pageBuilder: (context, state) {
        final blockId = state.pathParameters['block_id']!;
        return CupertinoPage(
          child: MyBlockDetailScreen(blockId: int.tryParse(blockId) ?? -1),
        );
      },
    ),
    GoRoute(
      path: AppRouter.userBlockDetail,
      pageBuilder: (context, state) {
        final blockId = state.pathParameters['block_id']!;
        return CupertinoPage(
          child: UserBlockDetailScreen(blockId: int.tryParse(blockId) ?? -1),
        );
      },
    ),
    GoRoute(
      path: AppRouter.profileConnection,
      pageBuilder: (context, state) {
        final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(
          child: ProfileConnectionScreen(
            connectionType: ConnectionsEnum.fromString(connectionType),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRouter.regionalInfo,
      pageBuilder: (context, state) {
        // final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(child: RegionalSettingsScreen());
      },
    ),
    GoRoute(
      path: AppRouter.referrals,
      pageBuilder: (context, state) {
        // final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(child: ReferralsScreen());
      },
    ),
    GoRoute(
      path: AppRouter.changePassword,
      pageBuilder: (context, state) {
        // final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(child: ChangePasswordScreen());
      },
    ),
    GoRoute(
      path: AppRouter.personalInfo,
      pageBuilder: (context, state) {
        // final connectionType = state.pathParameters['connection_type']!;
        return CupertinoPage(child: PersonalInfoScreen());
      },
    ),
    GoRoute(
      path: AppRouter.createQuestions,
      pageBuilder: (context, state) {
        final questionId = state.pathParameters['question_id'];
        return CupertinoPage(
          child: CreateQuestionsScreen(
            questionId: int.tryParse(questionId ?? ""),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRouter.createBlock,
      pageBuilder: (context, state) {
        final blockId = state.pathParameters['block_id'];
        return CupertinoPage(
          child: CreateBlockScreen(blockId: int.tryParse(blockId ?? "")),
        );
      },
    ),
    StatefulShellRoute(
      parentNavigatorKey: navigatorKey,
      navigatorContainerBuilder: (_, navShell, children) =>
          ShellScreen(navShell: navShell, children: children),
      builder: (_, __, child) => child,
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.home,
              builder: (_, state) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.search,
              builder: (_, state) =>  SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.testMain,
              builder: (_, state) => const TestScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.library,
              builder: (_, state) => const LibraryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.profile,
              builder: (_, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    this.draggableScrollSheetBuilder,
    this.builder,
    this.enableDrag = true,
    this.isDismissible = true,
    this.isScrollControlled = true,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : assert(
         (builder != null && draggableScrollSheetBuilder == null) ||
             (builder == null && draggableScrollSheetBuilder != null),
         'Provide EITHER builder OR draggableScrollSheetBuilder, not both',
       );

  final ScrollableWidgetBuilder? draggableScrollSheetBuilder;
  final WidgetBuilder? builder;
  final bool enableDrag;
  final bool isDismissible;
  final bool isScrollControlled;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      settings: this,
      backgroundColor: Colors.transparent,
      builder: (ctx) => draggableScrollSheetBuilder != null
          ? DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.25,
              maxChildSize: 0.9,
              expand: false,
              builder: draggableScrollSheetBuilder!,
            )
          : builder!.call(ctx),
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      constraints: draggableScrollSheetBuilder != null
          ? BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.8,
              minHeight: MediaQuery.sizeOf(context).height * 0.3,
            )
          : BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
              minHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
    );
  }
}
