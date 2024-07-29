class Endpoints {
  static const String basicUrl = "http://192.168.1.45:8080/crmsfpl";
  // static const String basicUrl = "http://65.109.229.140:8080/crmsfpl";
  // static const String basicUrl = "http://192.168.64.123:8080/crmsfpl";
  static const int connectionTimeout = 10;
  static const int receiveTimeout = 10;

  // AUTH
  static const String singupUrl = "$basicUrl/auth/register";
  static const String logingUrl = "$basicUrl/auth/login";
  // PUNCH IN
  static const String punchIn = "$basicUrl/se/punchin";
  static const String punchOut = "$basicUrl/se/punchout";
  static const String lastPunchInDetails = "$basicUrl/se/getlastpunchdetails";

  // CHECK IN
  static const String checkInPostUrl = "$basicUrl/se/checkin";
  static const String checkoutPostUrl = "$basicUrl/se/checkout";

  // ZONE
  static const String getAllZones = "/auth/zones";
  // ROLES
  static const String getAllRoles = "/auth/roles";
  // DIVISIONS
  static const String getAllDivisions = "/auth/divisions";
  // CUSTOMERS
  static const String createCustomer = "$basicUrl/se/addcustomer";
  static const String getAllCustomers = "$basicUrl/se/allcustomers";
  static const String lastCheckInCheckOut = "$basicUrl/se/getlastcheckinoutdetails";
  static const String checkin = "$basicUrl/se/checkin";
  static const String checkOut = "$basicUrl/se/checkout";
   static const String searchCustomer = '$basicUrl/se/search-customer';
  static const String customerFullDeails = '$basicUrl/se/cumstomer-fulldetails';

    static const String allPurposes = "$basicUrl/se/type-of-purposes";

   static const String assignedToUrl = "$basicUrl/se/salesrepsinzone"; 


  static const String getAllCustomerDemo = '$basicUrl/se/all-customers-demo';
   // MONTHLY PLAN
  static const String getAllMonthlyPlans = '$basicUrl/se/monthly-plan?createdDate=';
  static const String monthlyPlanCreate = '$basicUrl/se/monthly-plan';
  static const String monthlyPlanUpdate = '$basicUrl/se/monthly-plan';
  static const String monthlyPlanApprove = '$basicUrl/se/monthly-plan/approve';
  static const String monthlyPlanReject = '$basicUrl/se/monthly-plan/reject';
  static const String monthlyPlanByMonthlyPlanId = '$basicUrl/se/monthly-plan/';
  static const String monthlyPlanMonths = '$basicUrl/se/monthly-plan/months?userId=';
  static const String monthlyPlanCustomers = '$basicUrl/customer-demo';
  static const String monthlyPlanDelte = '$basicUrl/se/monthly-plan';
  static const String monthlyPlanPendingRequests = '$basicUrl/se/monthly-plan/pending-monthly-plans';
  static const String monthlyPlanSearch = '$basicUrl/user/subordinates/cascade?searchPattern=';
  // ROUTES
  static const String allRoutes = '$basicUrl/se/all-routes';
  // EMPLOYESS
    static const String allEmployess = '$basicUrl/se/alluserdetails';

    // PRIMARY SOURCES
      static const String getAllPrimarySources = '$basicUrl/se/primarysource-data';


  // ALERTS
  static const String allAlerts = '$basicUrl/se/notifications';
  static const String getAlertNotificationCount = '$basicUrl/se/unread-notifications-count';
  static const String alertMarkAsRead = '$basicUrl/se/notifications';  

  // ADDRESS
  static const String countires = '$basicUrl/auth/countries';
  static const String states = '$basicUrl/auth/states';
  static const String districts = '$basicUrl/auth/districtsbystate';

  // LOCALILTY
  static const String getLocalitiesByCity = '$basicUrl/auth/localitybycity';

  // CITIES
  static const String getCityByStateId = '$basicUrl/auth/citybystate';

  // KYC 
  static const String getPendingKycCustomers = '$basicUrl/se/kycpendingcustomers';

  // SALES ORDER
  static const String getAllProducts = '$basicUrl/se/product';
  static const String getProductPriceById = '$basicUrl/se/product-price/';

  // UOM
  static const String getAllUom = '$basicUrl/se/uom';

  // PAYMENT MODES
  static const String getAllPaymentModes = '$basicUrl/se/payment-mode';

}
