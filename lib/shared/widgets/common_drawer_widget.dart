// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_state.dart';

import '../../src/config/constants/app_strings.dart';
import '../../src/features/Policies/contact_us_scren.dart';
import '../../src/features/Policies/faq_screen.dart';
import '../../src/features/Policies/privacy_pollicy_screen.dart';
import '../../src/features/Policies/terms_and_conditions_screen.dart';


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
            ReusableListTileWidget(title: "${data.profileResponseModel.userModel!.username}\n(${(data.profileResponseModel.userModel!.id.toString())})", icon: Icons.person,),
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
          //  20.verticalSpace,
          //  NEW VERSION WITH 15 MINUTES INTERVAL
            const ReusableListTileWidget(title: "App version no", icon: Icons.dashboard,subTitleText: AppStrings.appVersion ,), 
             const Divider(), 
                       GestureDetector(
                        onTap: () {
                          if(Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (c) =>  const ContactUsScreen()));
                        },
                        child: const ReusableListTileWidget(title: "Contact Us", icon: Icons.contact_emergency ,)),
           const Divider(), 
                       GestureDetector(
                        onTap: () {
                          if(Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (c) =>  const PrivacyPolicyScreen()));
                        },
                        child: const ReusableListTileWidget(title: "Privacy Policy", icon: Icons.shield_outlined ,)), 

         const Divider(), 
                       GestureDetector(
                           onTap: () {
                          if(Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (c) =>   const TermsAndConditionsScreen()));
                        },
                        child: const ReusableListTileWidget(title: "Terms & Conditions", icon: Icons.contact_page_rounded ,)), 

             const Divider(), 
                       GestureDetector(
                           onTap: () {
                          if(Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (c) =>  const FaqScreen()));
                        },
                        child: const ReusableListTileWidget(title: "FAQ'S", icon: Icons.question_answer,)),

              // LOGOUT
    //           ListTile(
    //             title: const CommonTextWidget(title: "Logout",textColor: AppColors.primaryColor,),
    //             onTap: () {
    //                showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       backgroundColor: Colors.white,
    //       title: const Text('Are you sure you want to Logout?'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop(); // CANCEL button action
    //           },
    //           child: const Text(
    //             'CANCEL',
    //             style: TextStyle(color: AppColors.primaryColor),
    //           ),
    //         ),
    //         ElevatedButton(
    //           onPressed: () async {
    //                    const platform = MethodChannel('com.srinivasa.crm');
    //             platform.invokeMethod('stop');
    //             // Handle LOGOUT button action
    //             // You can add your logout logic here
    //             final localstorge = locator.get<KeyValueStorage>();
    //             final locationServices = locator.get<CommonLocationServices>();
    //             final position = await locationServices.getUserCurrentPosition();

    //             // await Workmanager().cancelAll();
    //             PunchoutPostModel punchoutPostModel = PunchoutPostModel(latitude: position.latitude.toString(), longitude: position.longitude.toString());
    //             await context.read<MarkAttendanceCubit>().punchOutLogic( isLogoutClicked: true);
              
    //             Fluttertoast.showToast(msg: "All Background services stopped");
    //           await  localstorge.sharedPreferences.clear();

    //           if(context.mounted) {
    //             Navigator.of(context).pop(); // Close the dialog

    //           }
    //             if(context.mounted) {
    //                Navigator.pushNamedAndRemoveUntil(
    //                 context, Routes.loginScreen, (route) => false);
    //             }
    //           },
    //           child: const Text('Yes',
    //               style: TextStyle(
    //                   color: AppColors.primaryColor,
    //                   fontWeight: FontWeight.bold)),
    //         ),
    //       ],
    //     );
    //   },
    // );
    //             },
    //             trailing: const Icon(Icons.logout),
    //           ),
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
    super.key,
    required this.title,
    this.subTitleText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(

                leading: Icon(icon),
                title: CommonTextWidget(title: title,maxLines: 2,textSize: 12.sp,),
                subtitle:subTitleText != null ? CommonTextWidget(title:  subTitleText ?? ""  ,textColor: Colors.black.withOpacity(0.6),fontWeight: FontWeight.w500,textSize: 12.sp,) : null,
              );
  }
}
