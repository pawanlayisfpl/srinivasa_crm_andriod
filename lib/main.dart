import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';

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
        // BLOCS
        // CUBITS
                BlocProvider(create: (_) => locator.get<LoginCubit>()),
                BlocProvider(create: (_) => locator.get<MarkAttendanceCubit>()),
                BlocProvider(create: (_) => locator.get<ProfileCubit>()),
                BlocProvider(create: (_) => locator.get<AllCustomerCubit>()),
                BlocProvider(create: (_) => locator.get<CheckinCubit>()),
                BlocProvider(create: (_) => locator.get<ViewMonthlyPlanCubit>()),
                BlocProvider(create: (_) => locator.get<CreateMonthlyPlanCubit>()),
                BlocProvider(create: (_) => locator.get<AlertCubit>()),
                BlocProvider(create: (_) => locator.get<SearchCustomerCubit>()),
                BlocProvider(create: (_) => locator.get<CustomerFullDetailsCubit>()),
                BlocProvider(create: (_) => locator.get<MonthlyPlanSearchCubit>()),
                BlocProvider(create: (_) => locator.get<MonthlyPlanPendingCubit>()),
                BlocProvider(create: (_) => locator.get<UpdateMonthlyPlanCubit>()),
                BlocProvider(create: (_) => locator.get<CustomerCreateCubit>()),

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
