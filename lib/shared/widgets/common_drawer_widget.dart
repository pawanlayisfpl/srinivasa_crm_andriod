// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Profile/data/datasource/local/profile_local_datasource.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_state.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_out_post_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';

class CommonDrawerWidget extends StatelessWidget {
  const CommonDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(orElse: () => const SizedBox.shrink() ,loadedLocal: (data) {
          
          return Drawer(
            
          child: ListView(
            children: [
              SizedBox(height: 0.1.sh,),
            // NAME
            ReusableListTileWidget(title: data.profileResponseModel.userModel!.username.toString(), icon: Icons.person,),
              const Divider(),
              // EMAIL
                     ReusableListTileWidget(title: data.profileResponseModel.userModel!.email.toString(), icon: Icons.email_outlined,),

              const Divider(),
              // PHONE
                                  ReusableListTileWidget(title: data.profileResponseModel.userModel!.contactNo.toString().trim(), icon: Icons.phone_android_rounded,),

              const Divider(),
              // ROLE
                                 ReusableListTileWidget(title: data.profileResponseModel.userModel!.authorities!.first.authority.toString(), icon: Icons.shield,),

              const Divider(),
              // ZONE
             ReusableListTileWidget(title: data.profileResponseModel.userModel!.zones!.map((e) => e.zoneName).join(", "), icon: Icons.location_city)
           ,
           const Divider(),
           ReusableListTileWidget(title: data.profileResponseModel.userModel!.repostingManagerName.toString(), icon: Icons.dashboard,subTitleText: "(Reporting Manager)" ,), 
           const Divider(), 
           20.verticalSpace,
              // LOGOUT
              ListTile(
                title: const CommonTextWidget(title: "Logout",textColor: AppColors.primaryColor,),
                onTap: () {
                   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Are you sure you want to Logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // CANCEL button action
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                       const platform = MethodChannel('com.example.srinivasa_crm_new');
                platform.invokeMethod('stop');
                // Handle LOGOUT button action
                // You can add your logout logic here
                final localstorge = locator.get<KeyValueStorage>();
                final locationServices = locator.get<CommonLocationServices>();
                final position = await locationServices.getUserCurrentPosition();

                // await Workmanager().cancelAll();
                PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: position.latitude.toString(), longitude: position.longitude.toString());
                await context.read<MarkAttendanceCubit>().punchOutLogic( isLogoutClicked: true);
              
                Fluttertoast.showToast(msg: "All Background services stopped");
              await  localstorge.sharedPreferences.clear();

              if(context.mounted) {
                Navigator.of(context).pop(); // Close the dialog

              }
                if(context.mounted) {
                   Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginScreen, (route) => false);
                }
              },
              child: const Text('Yes',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
                },
                trailing: const Icon(Icons.logout),
              ),
            ],
          ).withSymetricPadding(horizontalPadding: 10.w,),
          
        );
        });
      },
    );
  }
}


class ReusableListTileWidget extends StatelessWidget {
  final String title;
  final String? subTitleText;
  final IconData icon;
  const ReusableListTileWidget({
    Key? key,
    required this.title,
    this.subTitleText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

                leading: Icon(icon),
                title: CommonTextWidget(title: title,maxLines: 2,),
                subtitle:subTitleText != null ? CommonTextWidget(title:  subTitleText ?? ""  ,textColor: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w500,) : null,
              );
  }
}
