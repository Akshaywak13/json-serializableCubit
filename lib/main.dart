import 'package:erp_demo/app/details/cubit/delete_cubit.dart';
import 'package:erp_demo/app/details/cubit/detail_screen_cubit.dart';
import 'package:erp_demo/app/home/cubit/cubit/homepage_cubit.dart';
import 'package:erp_demo/app/login/cubit/login_cubit.dart';
import 'package:erp_demo/app/new_post/cubit/new_post_cubit.dart';
import 'package:erp_demo/app/otp/cubit/cubit/otp_cubit.dart';
import 'package:erp_demo/utils/preferences/local_preferences.dart';
import 'package:erp_demo/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = Routes();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => OtpCubit()),
          BlocProvider(create: (context) => HomepageCubit()),
          BlocProvider(create: (context) => DetailScreenCubit()),
          BlocProvider(create: (context) => DeleteCubit()),
          BlocProvider(create: (context) => NewPostCubit()),
        ],
        child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                pageTransitionsTheme: const PageTransitionsTheme(builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                })),
            routeInformationParser: routes.router.routeInformationParser,
            routerDelegate: routes.router.routerDelegate,
            routeInformationProvider: routes.router.routeInformationProvider,
          ),
        ));
  }
}
