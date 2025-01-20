

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
  DashboardModel(iconPath: 'assets/png/timeout.png', iconName: 'Punch Out'),
  DashboardModel(iconPath: 'assets/png/kyc.png', iconName: 'Kyc'),
  // DashboardModel(iconPath: 'assets/png/reports.png', iconName: 'Reports'),
  DashboardModel(iconPath: 'assets/png/order.png', iconName: 'Sales Order'),
  DashboardModel(iconPath: 'assets/png/activity.png', iconName: 'Activity'),
  DashboardModel(iconPath: 'assets/png/ticket.png', iconName: 'Tickets'),
  DashboardModel(iconPath: 'assets/png/profile_card.png', iconName: 'My Profile'),
  // DashboardModel(iconPath: "assets/png/enquiry.png", iconName: 'ENQUIRY'),
  // DashboardModel(iconPath: "assets/png/enquiry.png", iconName: 'SALES ORDER'),
];