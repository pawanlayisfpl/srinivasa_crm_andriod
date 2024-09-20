import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/user_activity_cubit.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/widget/user_activity_body_widget.dart';

class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({super.key});

  @override
  State<UserActivityScreen> createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<UserActivityCubit>().getUserActivity(dateTime: DateTime.now()); 
      context.read<UserActivityCubit>().resetState();
      context.read<UserActivityCubit>().getUserActivity(dateTime: DateTime.now()); 
         });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Activity'),
      ),
      body: const SafeArea(child: UserActivityBodyWidget()),
    );
  }
}