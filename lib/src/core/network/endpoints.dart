class Endpoints {
  static const String basicUrl = "http://192.168.1.45:8080/crmsfpl";
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
  static const String checkInPostUrl = "";
  static const String checkoutPostUrl = "";

  // ZONE
  static const String getAllZones = "/auth/zones";
  // ROLES
  static const String getAllRoles = "/auth/roles";
  // DIVISIONS
  static const String getAllDivisions = "/auth/divisions";
  // CUSTOMERS
  static const String getAllCustomers = "$basicUrl/crmsfpl/se/allcustomers";
  static const String lastCheckInCheckOut = "$basicUrl/se/getlastcheckinoutdetails";
  static const String checkin = "$basicUrl/se/checkin";
  static const String checkOut = "$basicUrl/se/checkout";
  // MONTHLY PLAN
  static const String getAllMonthlyPlans = '$basicUrl/se/monthly-report';
}
