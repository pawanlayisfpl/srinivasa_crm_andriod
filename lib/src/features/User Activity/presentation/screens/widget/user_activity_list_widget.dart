// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/widget/user_activity_card_widget.dart';

class UserActivityListWidget extends StatelessWidget {
  const UserActivityListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityCubit, UserActivityState>(
      builder: (context, state) {
        if (state.userActivityModel == null || state.userActivityModel!.repTravelLogsData == null || state.userActivityModel!.repTravelLogsData!.isEmpty) {
          return const Center(
            child: CommonTextWidget(
              title: 'No Data Found',
              fontWeight: FontWeight.w500,
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              itemCount: state.userActivityModel!.repTravelLogsData!.length,
              itemBuilder: (context, index) {
                return UserActivityCardWidget(repTravelLogsData: state.userActivityModel!.repTravelLogsData![index]);
              },
            ),
          );
        }
      },
    );
  }
}
