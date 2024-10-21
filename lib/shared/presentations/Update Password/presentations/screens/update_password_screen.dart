import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/shared/presentations/Update%20Password/presentations/widget/update_password_body_widget.dart';


class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Password"),
      ),
      body: SafeArea(child: UpdatePasswordBodyWidget(),),

    );
  }
}