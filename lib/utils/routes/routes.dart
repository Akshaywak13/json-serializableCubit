import 'package:erp_demo/app/details/detail_screen.dart';
import 'package:erp_demo/app/home/model/home_model.dart';
import 'package:erp_demo/app/home/view/home_screen.dart';
import 'package:erp_demo/app/login/view/login_screen.dart';
import 'package:erp_demo/app/new_post/view/new_post.dart';
import 'package:erp_demo/app/otp/view/otp_screen.dart';
import 'package:erp_demo/app/practic/custom_paint.dart';
import 'package:erp_demo/app/practic/login_vyapo.dart';
import 'package:erp_demo/app/practic/practic.dart';
import 'package:erp_demo/app/practic/select_item_listview.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String home = '/';
  static const String loginScreen = '/login';
  static const String otpScreen = '/otp';
  static const String homeScreen = '/home';
  static const String detailScreen = '/detail';
  static const String newPostScreen = '/newPost';
  // static const String splashScreen = '/splash';
  static const String customPaint = '/customPaint';
  static const String practic = '/practic';
  static const String selectedItemsListview = '/selectedItemsListview';
  static const String loginVyapo = '/loginVyapo';

  late final GoRouter _getRouter =
      GoRouter(initialLocation: loginScreen, 
      routes: [
    GoRoute(
      path: loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        path: otpScreen,
        builder: (context, state) {
          final phoneNumber = state.extra as String;
          return OtpScreen(phoneNumber: phoneNumber);
        }),
    GoRoute(
      path: homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(path: detailScreen,
    builder: (context, state) {
      final home = state.extra as HomeModel;
          return DetailScreen(home: home);
    },
    ),
    GoRoute(path: newPostScreen,
    builder: (context, state) => const NewPostScreen(),
    ),
    GoRoute(path: customPaint,
    builder: (context, state) => const CustomPaintScreen(),
    ),
    GoRoute(path: practic,
    builder: (context, state) => PracticDemo(),
    ),
    GoRoute(path: selectedItemsListview,
    builder: (context, state) =>const SelectedItemsListview(),
    ),
    GoRoute(path: loginVyapo,
    builder: (context, state) => const LoginScreenVyapo(),
    )
  ]);
  GoRouter get router => _getRouter;
}

