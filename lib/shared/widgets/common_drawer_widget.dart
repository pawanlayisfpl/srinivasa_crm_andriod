import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';


class CommonDrawerWidget extends StatelessWidget {
  const CommonDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           Container(
            padding: EdgeInsets.only(top: 60.h,left: 10.w),
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            alignment: Alignment.centerLeft,
            child:    const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person,color: AppColors.primaryColor,),
                ),
                Expanded(
                  child: ListTile(
                  title: CommonTextWidget(title: 'Ajay Sagar',textColor: Colors.white,),
                  subtitle: CommonTextWidget(title: 'ajay@gmail.com',textColor: Colors.white,),
                            ),
                ),
              ],
            )
          ),
      
         ListTile(
  title: const Text('Item 1'),
  onTap: () {
    if (context.mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }
  },
),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}