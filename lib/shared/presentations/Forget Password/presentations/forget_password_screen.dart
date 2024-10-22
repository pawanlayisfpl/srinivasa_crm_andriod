import 'package:flutter/material.dart';

import 'widgets/forget_password_body_widget.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Forget Password"),),
    body: const SafeArea(child: ForgetPasswordBodyWidget(),),
    );
  }
}