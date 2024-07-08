import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/dashboard_card_widget.dart';
import '../../../config/config.dart';

class CustomerDashbaordScreen extends StatelessWidget {
  const CustomerDashbaordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardNames = [
      'View Customers List',
      'Add Customers',


      'Search Customer ',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw), // 5% padding
        child: Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cardNames.length,
              itemBuilder: (c, i) {
                return GestureDetector(
                    onTap: () {
                      switch (i) {
                        case 1:
                           Navigator.pushNamed(
                              context, Routes.addCustomerScreen);
                      
                          break;
                        case 0:
                        // Fluttertoast.showToast(msg: "Add Customer Feature is disabled");
                            Navigator.pushNamed(context, Routes.customer);
                       
                          break;
                        case 2:
                        // Fluttertoast.showToast(msg: "View Customer Full Details Feature is disabled");
                          Navigator.pushNamed(
                              context, Routes.customerSearchScreen);
                          break;
                      }
                    },
                    child: DashboardChildrenCardWidget(
                      title: cardNames[i],
                    ));
              }),
        ),
      ),
    );
  }
}
