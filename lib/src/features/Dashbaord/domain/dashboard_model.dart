

class DashboardModel {
  final String iconPath;
  final String iconName;
  final  bool? isAlert;
  DashboardModel({
    required this.iconPath,
    required this.iconName,
    this.isAlert
  });
}

List<DashboardModel> dashboardIconLists = [
  DashboardModel(iconPath: 'assets/png/customer.png', iconName: 'Customer'),
  DashboardModel(iconPath: "assets/png/calendar.png", iconName: 'Monthly Plan'),
  DashboardModel(iconPath: 'assets/png/notification.png', iconName: 'Alerts',isAlert: true ),
  DashboardModel(iconPath: 'assets/png/timeout.png', iconName: 'Timeout'),
  DashboardModel(iconPath: 'assets/png/kyc.png', iconName: 'Kyc'),
  // DashboardModel(iconPath: 'assets/png/reports.png', iconName: 'Reports'),
  DashboardModel(iconPath: 'assets/png/order.png', iconName: 'Sales Order'),
  DashboardModel(iconPath: 'assets/png/order.png', iconName: 'User Activity'),
  // DashboardModel(iconPath: "assets/png/enquiry.png", iconName: 'ENQUIRY'),
  // DashboardModel(iconPath: "assets/png/enquiry.png", iconName: 'SALES ORDER'),
];