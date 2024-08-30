import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/widget/user_activity_date_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/widget/user_activity_list_widget.dart';

class UserActivityBodyWidget extends StatelessWidget {
  const UserActivityBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
       const UserActivityDateTextFieldWidget(isClickEnabled: false,),
               16.verticalSpace,

    context.watch<UserActivityCubit>().state.userActivityModel == null  || context.watch<UserActivityCubit>().state.isLoading == true || context.watch<UserActivityCubit>().state.userActivityModel!.repPunchOut == null || context.watch<UserActivityCubit>().state.userActivityModel!.repPunchIn == null ? const SizedBox.shrink() : 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
        height: 0.08.sh,
        child: Row(
          children: [
            // PUNCH IN CONTAINER
              Expanded(
                flex: 5,
                child: Card(
                shadowColor: Colors.grey,
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // PUNCH IN ROW WIDGET
                child: Row(
                  children: [
                    10.horizontalSpace,
                    Transform.scale(
                      scale: 1.3,
                      child: const Icon(Icons.location_pin,color: Colors.green,)),
                   Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const CommonTextWidget(title: 'Punch In',fontWeight: FontWeight.w500,),
                    CommonTextWidget(title: DateFormat.yMd().add_jm().format(DateTime.parse(context.watch<UserActivityCubit>().state.userActivityModel!.repPunchIn!.punchTime.toString())),textSize: 12.sp,maxLines: 3)
                   ],))
                  ],
                ),
              ),),
              10.horizontalSpace,
              // PUNCH OUT CONTAINER
                 Expanded(
                       flex: 5,
                  
                  child: Card(
                shadowColor: Colors.grey,
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // PUNCH OUT ROW WIDGET
                child: Row(
                  children: [
                        10.horizontalSpace,
                    Transform.scale(
                      scale: 1.3,
                      child: const Icon(Icons.location_pin,color: Colors.red,)),
                   Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   const CommonTextWidget(title: 'Punch Out',fontWeight: FontWeight.w500,),
                    CommonTextWidget(title: DateFormat.yMd().add_jm().format(DateTime.parse(context.watch<UserActivityCubit>().state.userActivityModel!.repPunchOut!.punchTime.toString())),textSize: 12.sp,maxLines: 3)
                   ],))
                  ],
                ),
              ),),
        
            ],),
            ),
      ),
        16.verticalSpace,
        BlocBuilder<UserActivityCubit, UserActivityState>(
          builder: (context, state) {
            return state.isLoading == true ?  const CustomLoadingWidget() : state.userActivityModel == null ?EmptyWidget(title: "No records found, try another date",callback: () {}) : const UserActivityListWidget();
            
          },
        ),
      ],
    );
  }
}
