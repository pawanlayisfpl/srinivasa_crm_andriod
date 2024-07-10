import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_state.dart';

class CommonDrawerWidget extends StatelessWidget {
  const CommonDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(orElse: () => const SizedBox.shrink() ,loadedLocal: (data) => Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 60.h, left: 10.w),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  alignment: Alignment.centerLeft,
                  child:  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: CommonTextWidget(
                            title: data.profileResponseModel.userModel!.username?.toCapitalize() ?? "No Name Found",
                            textColor: Colors.white,
                          ),
                          subtitle: CommonTextWidget(
                            maxLines: 2,
                            title: data.profileResponseModel.userModel!.email.toString().toCapitalize(),
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
           
            ],
          ),
        ));
      },
    );
  }
}
