import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import 'widgets/login_body_widget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 
     await context.read<LoginCubit>().getInitialValues();
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LoginBodyWidget()));
  }
}