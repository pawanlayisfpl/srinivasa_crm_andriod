import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/widget/user_activity_list_widget.dart';

class UserActivityBodyWidget extends StatelessWidget {
  const UserActivityBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        CommonDateTextField(textEditingController: context.watch<UserActivityCubit>().dateController, hintText: 'pick your date',

            onTap: () {
              context.read<UserActivityCubit>().pickDate(context);
            }),
        10.verticalSpace,
        Expanded(
          child: BlocBuilder<UserActivityCubit, UserActivityState>(
            builder: (context, state) {
              return state.isLoading == true ?  const CustomLoadingWidget() : const UserActivityListWidget();
              
            },
          ),
        ),
      ],
    ).withSymetricPadding(horizontalPadding: 20.w);
  }
}
