import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/firebase_options.dart';
import 'package:srinivasa_crm_new/shared/presentations/AllEmploye/cubit/all_employe_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Employee/cubit/employee_update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Otp/presentations/cubit/otp_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/cubit/forget_cubit.dart';
// import 'package:srinivasa_crm_new/ENV.dart';

import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/Add%20Comment/cubit/add_comment_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/View%20Comment/cubit/view_comment_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/cubit/all_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Full%20Details/cubit/customer_full_details_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/cubit/search_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/presentation/cubit/update_customer_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/dashboard_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/cubit/kyc_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/daily_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Ticket/cubit/view_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/add_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_cubit.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';

import 'src/config/config.dart';
import 'src/features/Sales Order/presentation/Sales Order Pending/cubit/pending_order_cubit.dart';
import 'src/features/login/presentation/cubit/login_cubit.dart';
// import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
//     as bg;
Future<void> backgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}




// /// Receive events from BackgroundGeolocation in Headless state.
// @pragma('vm:entry-point')
// void backgroundGeolocationHeadlessTask(bg.HeadlessEvent headlessEvent) async {
//   debugPrint('📬 --> $headlessEvent');

//   switch (headlessEvent.name) {
//     case bg.Event.BOOT:
//       bg.State state = await bg.BackgroundGeolocation.state;
//       debugPrint("📬 didDeviceReboot: ${state.didDeviceReboot}");
//       break;
//     case bg.Event.TERMINATE:
//       bg.State state = await bg.BackgroundGeolocation.state;
//       if (state.stopOnTerminate!) {
//         Fluttertoast.showToast(msg: "stopOnTerminate: true");
//         // Don't request getCurrentPosition when stopOnTerminate: true
//         return;
//       }
//       try {
//         bg.Location location =
//             await bg.BackgroundGeolocation.getCurrentPosition(
//                 samples: 1,
//                 persist: true,
//                 extras: {
//                   "event": "terminate",
//                   "headless": true
//                 }
//             );
//         debugPrint("[getCurrentPosition] Headless: $location");
//       } catch (error) {
//         debugPrint("[getCurrentPosition] Headless ERROR: $error");
//       }

//       break;
//     case bg.Event.HEARTBEAT:
//       try {
//         bg.Location location = await bg.BackgroundGeolocation.getCurrentPosition(
//           samples: 2,
//           timeout: 10,
//           extras: {
//             "event": "heartbeat",
//             "headless": true
//           }
//         );

//         debugPrint('[getCurrentPosition] Headless: $location');
//       } catch (error) {
//         debugPrint('[getCurrentPosition] Headless ERROR: $error');
//       }
//       break;
//     case bg.Event.LOCATION:
//       bg.Location location = headlessEvent.event;
//       debugPrint(location.toString());
//       break;
//     case bg.Event.MOTIONCHANGE:
//       bg.Location location = headlessEvent.event;
//       debugPrint(location.toString());
//       break;
//     case bg.Event.GEOFENCE:
//       bg.GeofenceEvent geofenceEvent = headlessEvent.event;
//       debugPrint(geofenceEvent.toString());
//       break;
//     case bg.Event.GEOFENCESCHANGE:
//       bg.GeofencesChangeEvent event = headlessEvent.event;
//       debugPrint(event.toString());
//       break;
//     case bg.Event.SCHEDULE:
//       bg.State state = headlessEvent.event;
//       debugPrint(state.toString());
//       break;
//     case bg.Event.ACTIVITYCHANGE:
//       bg.ActivityChangeEvent event = headlessEvent.event;
//       debugPrint(event.toString());
//       break;
//     case bg.Event.HTTP:
//       bg.HttpEvent response = headlessEvent.event;
//       debugPrint(response.toString());
//       break;
//     case bg.Event.POWERSAVECHANGE:
//       bool enabled = headlessEvent.event;
//       debugPrint(enabled.toString());
//       break;
//     case bg.Event.CONNECTIVITYCHANGE:
//       bg.ConnectivityChangeEvent event = headlessEvent.event;
//       debugPrint(event.toString());
//       break;
//     case bg.Event.ENABLEDCHANGE:
//       bool enabled = headlessEvent.event;
//       debugPrint(enabled.toString());
//       break;
//     case bg.Event.AUTHORIZATION:
//       bg.AuthorizationEvent event = headlessEvent.event;
//       debugPrint(event.toString());
//       bg.BackgroundGeolocation.setConfig(
//           bg.Config(url: "${ENV.TRACKER_HOST}/api/locations"));
//       break;
//   }
// }


// /// Receive events from BackgroundFetch in Headless state.
// @pragma('vm:entry-point')
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   String taskId = task.taskId;

//   // Is this a background_fetch timeout event?  If so, simply #finish and bail-out.
//   if (task.timeout) {
//     debugPrint("[BackgroundFetch] HeadlessTask TIMEOUT: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }

//   debugPrint("[BackgroundFetch] HeadlessTask: $taskId");

//   try {
//     var location = await bg.BackgroundGeolocation.getCurrentPosition(
// 	    samples: 2,
//       extras: {
//         "event": "background-fetch",
//         "headless": true
//       }
//     );
//     debugPrint("[location] $location");
//   } catch(error) {
//     debugPrint("[location] ERROR: $error");
//   }

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int count = 0;
//   if (prefs.get("fetch-count") != null) {
//     count = prefs.getInt("fetch-count")!;
//   }
//   prefs.setInt("fetch-count", ++count);
//   Fluttertoast.showToast(msg: 'BackgroundFetch HeadlessTask: $taskId, count: $count');
//   debugPrint('[BackgroundFetch] count: $count');

//   BackgroundFetch.finish(taskId);
// }



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
   HttpOverrides.global = MyHttpOverrides();

  await _initDependencies();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);




  // In debug mode, use the Firebase local emulator.
  if (kDebugMode) {
    const String devMachineIP = '192.168.x.x';
    // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    // FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

    debugPrint('Using Firebase emulator suite');

    // FirebaseFirestfirore.instance.useFirestoreEmulator(devMachineIP, 8080);
    await FirebaseAuth.instance.useAuthEmulator(devMachineIP, 9099);
    FirebaseFunctions.instance.useFunctionsEmulator(devMachineIP, 5001);
  }
  
  // Workmanager(

  // ).initialize(callbackDispatcher, isInDebugMode: true,);

    // TransistorAuth.registerErrorHandler();

  /// Register BackgroundGeolocation headless-task.
  // bg.BackgroundGeolocation.registerHeadlessTask(
  //     backgroundGeolocationHeadlessTask);

  /// Register BackgroundFetch headless-task.
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
   

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
        BlocProvider(create: (_) => locator.get<KycCubit>()),
        BlocProvider(create: (_) => locator.get<KycUploadCubit>()),
        BlocProvider(create: (_) => locator.get<DashboardCubit>()),
        BlocProvider(create: (_) => locator.get<SalesOrderCreateCubit>()),
        BlocProvider(create: (_) => locator.get<SalesOrderCreateCubit>()),
        BlocProvider(create: (_) => locator.get<SalesOrderViewCubit>()),
        BlocProvider(create: (_) => locator.get<SalesOrderParticularCubit>()),
        BlocProvider(create: (_) => locator.get<PendingOrderCubit>()),
        BlocProvider(create: (_) => locator.get<DailyPlanCubit>()),
        BlocProvider(create: (_) => locator.get<UserActivityCubit>()),
        BlocProvider(create: (_) => locator.get<ForgetPasswordCubit>()),
        BlocProvider(create: (_) => locator.get<OtpCubit>()),
        BlocProvider(create: (_) => locator.get<UpdateCubit>()),
        BlocProvider(create: (_) => locator.get<AddTicketCubit>()),
        BlocProvider(create: (_) => locator.get<ViewTicketCubit>()),
        BlocProvider(create: (_) => locator.get<ViewParticularTicketCubit>()),
        BlocProvider(create: (_) => locator.get<AddCommentCubit>()),
        BlocProvider(create: (_) => locator.get<ViewCommentsCubit>()),
        BlocProvider(create: (_) => locator.get<UpdateCustomerCubit>()),
        BlocProvider(create: (_) => locator.get<EmployeUpdateCubit>()),
        BlocProvider(create: (_) => locator.get<AllEmployeCubit>()),
        BlocProvider(create: (_) => locator.get<TravelDataCubit>()),
      ],
      child: MaterialApp(
        navigatorKey: AppKeys.globalNavigatorKey,
        scaffoldMessengerKey: AppKeys.scaffoldKey,
        onGenerateRoute: RouteGenerator.getRoute,
        
        initialRoute: Platform.isAndroid ?  Routes.locationPermissionScreen : Routes.loginScreen,
        title: 'SFPL CRM',
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


 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



// OFFLINE WORKING FOR LOGIN, ALL CUSTOMERS, CHECKIN AND CHECKOUT ,SALES ORDER AND ALERTS,
// urls
  // static const String basicUrl = "http://192.168.1.45:8080/crmsfpl";
  // static const String testUrl = "http://65.109.229.140:8080/crmsfpl";
  // static const String testUrl2 = "http://95.216.201.117:8081/crmsfpl/";
      // static const String basicUrl = "https://crmapitest.srinivasa.co:8446/crm_sfpl";

  //  NEW VERSION WITH 15 MINUTES INTERVAL (1.0.2) - NOV -DEPLOYEMENT

      // static const String new-live-url = "http://180.149.244.56:8081/crm_sfpl";

      // PUNCH IN, PUNCH OUT , CHEKCIN , CHECK OUT,
