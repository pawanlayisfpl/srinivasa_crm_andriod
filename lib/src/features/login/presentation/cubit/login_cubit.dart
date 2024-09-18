  // ignore_for_file: public_member_api_docs, sort_constructors_first




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';



import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../core/model/model.dart';
import '../../domain/models/email_field.dart';
import '../../domain/models/login_post_model.dart';
import '../../domain/models/password_field.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
    final LoginUseCase loginUseCase;
    final KeyValueStorage keyValueStorage;
  LoginCubit(
    this.loginUseCase,
    this.keyValueStorage,
  ) : super(LoginState.initial());

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void emailChanged(String value) {
      
      emit(state.copyWith(
          emailField: EmailField(value), isLoginFailed: false, showError: false));
    }

    void passwordChanged(String value) {
      emit(state.copyWith(
          passwordField: PasswordField(value),
          isLoginFailed: false,
          showError: false));
    }

    void toggleisRememberMe() {
      emit(state.copyWith(isRememberMe: !state.isRememberMe,showError: false,isLoginSuccess: false,isLoginFailed: false));
    }



    Future<void> getInitialValues() async {
      // final token = keyValueStorage.sharedPreferences.getString(KeyValueStrings.token);

      // if(token != null) {
      //   emit(state.copyWith(isLoginSuccess: true));
      // }
      final email = keyValueStorage.sharedPreferences.getString(KeyValueStrings.email);
      final password = keyValueStorage.sharedPreferences.getString(KeyValueStrings.password);

      if (email != null && password != null) {
        emailController.text = email;
        passwordController.text = password;
        emit(state.copyWith(
          emailField: EmailField(email),
          passwordField: PasswordField(password),
          isRememberMe: true,
        ));
      }else {
        
      }
    }
    
    Future<void> login() async {
      emit(state.copyWith(isLoading: true,isLoginFailed: false,isLoginSuccess: false,));
      final email = state.emailField.value.isRight();
      final password = state.passwordField.value.isRight();

      if (email && password) {
        LoginPostModel loginPostModel = LoginPostModel(
          email: state.emailField.value.getOrElse(() => ''),
          password: state.passwordField.value.getOrElse(() => ''),
        );
        final result = await loginUseCase.execute(loginPostModel: loginPostModel,);
        await result.fold((l) async { // add async here
          ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
          emit(state.copyWith(errorMessage: l.toString(),isLoginFailed: true,isLoginSuccess: false,isLoading: false,apiFailedModel: apiFailedModel));
        }, (r) async {
          // LoginResponseModel? loginResponseModel = r;
          debugPrint(r.toJson().toString());
          if(r.user != null && r.jwt != null)  {
          await keyValueStorage.sharedPreferences.setString(KeyValueStrings.token, r.jwt ?? "" );

          }




          if(state.isRememberMe) {
            await keyValueStorage.sharedPreferences.setString(KeyValueStrings.email, state.emailField.value.getOrElse(() => '')); 
            await keyValueStorage.sharedPreferences.setString(KeyValueStrings.password, state.passwordField.value.getOrElse(() => ''));
          } else {
            await keyValueStorage.sharedPreferences.remove(KeyValueStrings.email); 
            await keyValueStorage.sharedPreferences.remove(KeyValueStrings.password); 
          }

          emailController.clear();
          passwordController.clear();

          emit(state.copyWith(isLoading: false, showError: false,isLoginSuccess: true,errorMessage: null));
          emit(LoginState.initial());
        });
      } else {
        Fluttertoast.showToast(msg: 'Please enter valid email and password',backgroundColor: Colors.red,textColor: Colors.white);
        emit(state.copyWith(isLoading: false, showError: true));
      }
    }
  }
