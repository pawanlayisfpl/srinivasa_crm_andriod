
class Endpoints {
  // static const String basicUrl = "http://192.168.1.45:8080/crmsfpl";
  // static const String basicUrl = "http://65.109.229.140:8080/crmsfpl";
  // static const String basicUrl = "http://192.168.64.123:8080/crmsfpl";
    // static const String basicUrl = "http://95.216.201.117:8081/crmsfpl";
    
    // static const String basicUrl = "http://180.149.244.56:8081/crm_sfpl";
   // static const String basicUrl = "https://crmapi.srinivasa.co:8446/crm_sfpl";
     static const String basicUrl = "https://crmapitest.srinivasa.co:8446/crm_sfpl";
    // static const String basicUrl = "https://crmapi.srinivasa.co:8081/crm_sfpl";
    // static const String basicUrl = "http://95.216.201.117:8081/crm_sfpl";
    // static const String testUrl = "http://95.216.201.117:8081/crm_sfpl";
  static const int connectionTimeout = 600;
  static const int receiveTimeout = 600;

  // AUTH
  static const String singupUrl = "$basicUrl/auth/register";
  static const String logingUrl = "$basicUrl/auth/login";
  // PUNCH IN
  static const String punchIn = "$basicUrl/se/punchin";
  static const String punchOut = "$basicUrl/se/punchout";
  static const String lastPunchInDetails = "$basicUrl/se/getlastpunchdetails";

  static const String findEmail = "$basicUrl/auth/forgot-password";
  static const String resetPassword = "$basicUrl/auth/reset-password";
  static const String updatePassword = "$basicUrl/user/update-password";

  // CHECK IN
  static const String checkInPostUrl = "$basicUrl/se/checkin";
  static const String checkoutPostUrl = "$basicUrl/se/checkout";

  // ZONE
  static const String getAllZones = "/auth/zones";
  // ROLES
  static const String getAllRoles = "/auth/roles";
  static const String getAllGloablEmployes = "/se/cascade-alluserdetails";
  static const String updateEmployeApi = "/admin/updateUser/";
  // DIVISIONS
  static const String getAllDivisions = "/auth/divisions";
  // CUSTOMERS
  static const String createCustomer = "$basicUrl/se/addcustomer";
  static const String updateCustomer = "$basicUrl/se/updatecustomer/";
  // static const String getAllCustomers = "$basicUrl/se/allcustomers";
  static const String getAllCustomers = "$basicUrl/se/allcustomers-icrm";
  static const String lastCheckInCheckOut = "$basicUrl/se/getlastcheckinoutdetails";
  static const String checkin = "$basicUrl/se/checkin";
  static const String checkOut = "$basicUrl/se/checkout";
   static const String searchCustomer = '$basicUrl/se/search-customer';
  static const String customerFullDeails = '$basicUrl/se/cumstomer-fulldetails';

    static const String allPurposes = "$basicUrl/se/type-of-purposes";

   static const String assignedToUrl = "$basicUrl/se/salesrepsinzone"; 
   static const String approvedCustomerUrl = "$basicUrl/se/allapprovedcustomers";


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
    static const String getEmployeById = '$basicUrl/admin/getUser/';

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
  static const String uploadKycUrl = '$basicUrl/se/uploadcustdocfiles';

  // SALES ORDER
  static const String createOrder = '$basicUrl/se/order';
  static const String getAllProducts = '$basicUrl/se/product';
  static const String getProductPriceById = '$basicUrl/se/product-price';
  static const String getAllSalesOrders = '$basicUrl/se/all-orders';
  static const String getParticularSaleModel = '$basicUrl/se/order/';
  static const String salesOrderReject = '$basicUrl/se/order/approve';
  static const String salesOrderApprove = '$basicUrl/se/order/reject';
  static const String getAllPenddingOrders = '$basicUrl/se/order/pending-orders';
  // UOM
  static const String getAllUom = '$basicUrl/se/uom';

  // PAYMENT MODES
  static const String getAllPaymentModes = '$basicUrl/se/payment-mode';


  // DAILY PLAN
  static const String createDailyPlan = '$basicUrl/se/daily-plan';

  // USER ACTIVITY
  static const String userActivity = '$basicUrl/se/employee-tracker?date=';

  // JOINT-EMPLOYE
  static const String jointemployesUrl = '$basicUrl/se/usersfromassignedzones';
  static const String getReportingMangersUrl = '$basicUrl/se/salesrepsinzone';

  // GET CUSTOMER DETAILS BY FARM ID
  static const String getCustomerDetailsFarmById = "$basicUrl/se/getFarm?farmId=";

  // TICKETS
  static const String createTicket = "$basicUrl/user/ticket";
  static const String getUserTickets = "$basicUrl/user/ticket";

  // COMMETNS
  static const String getAllCommentsByTicketId = "$basicUrl/user/ticket/";
  static const String createComment = "$basicUrl/user/tickets/";
  static const String deleteComment = "$basicUrl/user/comment/";
  static const String updateComment = "$basicUrl/user/comment/";

  // DELIVERY TYPES 
  static const String getAllDeliveryTypes = '$basicUrl/se/delivery-type';


  static const String locationUrl = '$basicUrl/se/locations';

  /// Travel Data
  static const String getTravelData = "$basicUrl/admin/custom-daily-report";

}

// 79
// india id 
