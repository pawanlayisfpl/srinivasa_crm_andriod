import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/cubit/update_cubit.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/widget/update_password_body_widget.dart';
import 'package:srinivasa_crm_new/src/features/login/presentation/screens/widgets/login_body_widget.dart';


class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      context.read<UpdateCubit>().onGetInitialData();
    });
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Password"),
      ),
      body: const SafeArea(child: UpdatePasswordBodyWidget(),),

    );
  }
}