// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';

import '../../../data/model/get/user_activity_model.dart';

class UserActivityListWidget extends StatelessWidget {
  const UserActivityListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityCubit, UserActivityState>(
      builder: (context, state) {
        return state.userActivityModel == null? EmptyWidget(title: 'No Activites found', callback: () {})  :  ListView.builder(
          shrinkWrap: true,
            itemBuilder: (c,i) {
          return Text(i.toString());
        },itemCount: state.userActivityModel == null ? 0  :state.userActivityModel!.repTravelLogsData!.length,);
      },
    );
  }
}
