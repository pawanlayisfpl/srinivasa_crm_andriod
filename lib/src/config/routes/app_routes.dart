
import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/all_customer_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/All%20Customers/screens/customer_details_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/customer_create_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/customer_search_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/customer_dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/Location%20Tracking/test_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/create_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/sales_dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/user_activity_screen.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/login_screen.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/screens/mark_attendance_screen.dart';

class Routes {
  // AUTH
  static const String locationScreen = "/locationScreen";
  // AUTH
  static const String loginScreen = "/login";
  static const String signupScreen = "/signup";
  static const String dashbaordScreen = "/dashboard";
  static const String markAttendanceScreen = "/markAttendanceScreen";
  static const String forgetPasswordEmail = "/forgetPassword";
  static const String forgetPasswordOtpScreen = "/forgetPasswordOtpScreen";
  static const String locationList = "/locationList";
  static const String customer = "/customer";
  static const String customerDetails = "/customerDetails";
  static const String checkIn = "/checkIN";
  static const String newLoginScreen = "/newLoginScreen";
  static const String addCustomerScreen = "/addCustomerScreen";
  static const String customerDashbaordScreen = "/customerDashbaordScreen";
  static const String customerFilterScreen = "/customerFilterScreen";
  static const String customerSearchScreen = "/customerSearchScreen";
  static const String customerFullDetailsScreen = "/customerFullDetailsScreen";
  static const String verificationScreen = "/verificationScreen";
  // CUSTOMER 
  static const String customerCreateScreen = "/customerCreateScreen";
  static const String customerCheckinScreen = '/customerCheckinScreen';
  static const String customerCheckoutScreen = '/customerCheckoutScreen';
  //  DAILY PLAN
  static const String dailyPlanDashboardScreen = "/dailyPlanDashboardScreen";
  static const String createDailyPlan = "/createDailyPlan";
  static const String viewDailyPlan = "/viewDailyPlan";
  static const String managerViewDailyPlan = "/managerviewDailyPlan";
  static const String selectEmployeListScreen = "/SelectEmployeListScreen";
  static const String selectJointEmployeListScreen =
      "/selectJointEmployeListScreen";
  // ENQUIRY SCREEN
  static const String addEnquiryScreen = '/addEnquiryScreen';
  static const String viewEnquiryScreen = '/viewEnquiryScreen';
  static const String viewEnquirySearchScreen = '/viewEnquirySearchScreen';
  static const String enquiryDashboardScreen = '/enquiryDashboardScreen';
  static const String enquiryExistingScreen = '/enquiryExistingScreen';
  static const String enquiyFullDetailsScreen = '/enquiyFullDetailsScreen';
  //! INTRO SCREEN
  static const String introScreen = '/introScreen';
  //! SALEs order
  static const String salesOrderDashboardScreen = '/salesOrderDashboardScreen';
  static const String addSalesOrderScreen = '/addSalesOrderScreen';
  static const String viewSalesOrderScreen = '/viewSalesOrderScreen';
  // DUMMY SCREEN
  static const String dummyScreen = '/viewSalesOrderScreen';
  static const String permissionScreen = '/permissoinScreen';
  static const String selectCustomerScreen = '/selectCustomerScreen';
  // MONTHLY PLAN
  static const String monthlyPlanScreen = '/monthlyPlanScreen';
  static const String monthlyPlanCreate = '/monthlyPlanCreate';
  // kyc screen
  static const String kycUploadScreen = '/kycUploadScreen';
  // TEST SCREEN
  static const String testScreen = '/testScreen';
  // USER ACTIVITY
  static const String userActivityScreen = '/userActivityScreen';
}



class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());
        case Routes.markAttendanceScreen:
        return MaterialPageRoute(builder: (_) =>  const MarkAttendanceScreen());
        // CUSTOMERS 
           case Routes.customerDashbaordScreen:
        return MaterialPageRoute(builder: (_) =>  const CustomerDashbaordScreen());
           case Routes.addCustomerScreen:
        return MaterialPageRoute(builder: (_) =>  const CustomerCreateScreen());
            case Routes.customer:
        return MaterialPageRoute(builder: (_) =>  const AllCustomerScreen());
            case Routes.customerDetails:
        return MaterialPageRoute(builder: (_) =>   CustomerDetailsScreen());
            case Routes.customerSearchScreen:
        return MaterialPageRoute(builder: (_) =>   const CustomerSearchScreen());
        // MONTHLY PLAN
             case Routes.monthlyPlanCreate:
        return MaterialPageRoute(builder: (_) =>   const CreateMonthlyPlanScreen());
        // SALES ORDER PLAN
             case Routes.salesOrderDashboardScreen:
        return MaterialPageRoute(builder: (_) =>   const SalesOrderDashboardScreen());
        // USER ACTIVITY SCREEN
             case Routes.userActivityScreen:
        return MaterialPageRoute(builder: (_) =>   const UserActivityScreen());
             case Routes.testScreen:
        return MaterialPageRoute(builder: (_) =>   const TestScreen());

  

      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Undefined Route")),
            body: const Center(child: Text("No Route Found")),
          ));
}