import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import 'src/config/config.dart';
import 'src/features/login/presentation/cubit/login_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await _initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
                BlocProvider(create: (_) => locator.get<LoginCubit>()),

      ],
      child: MaterialApp(
              navigatorKey: AppKeys.globalNavigatorKey, 
              scaffoldMessengerKey: AppKeys.scaffoldKey,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.loginScreen,
              title: 'SF CRM',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Poppins',
        
              
                inputDecorationTheme: InputDecorationTheme(
                  
                  border: AppStyles.inputBorder,
                  // focusedBorder: AppStyles.focusBorder,
                  // labelStyle: AppStyles.labelStyle
                ),
                  appBarTheme: const AppBarTheme(
                    backgroundColor: AppColors.primaryColor,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    iconTheme: IconThemeData(color: Colors.white),
                  ),
                  primaryColor: AppColors.primaryColor,
                  scaffoldBackgroundColor: Colors.white),
                  
              builder: (context, child) {
                ScreenUtil.init(context,
                    designSize: const Size(390, 844),
                    minTextAdapt: true,
                    splitScreenMode: true);
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: TextScaler.linear(1.0.sp)),
                    child: child!);
              },
            ),
    );
  }
}


Future<void> _initDependencies() async {
  await registerDependencies(Environment.dev);
  locator.registerLazySingleton<Environment>(
      () => const Environment(Environment.prod));
}
