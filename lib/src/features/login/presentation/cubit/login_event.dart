import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.emailChanged({required String value}) = EmailChanged;
  factory LoginEvent.passwordChanged({required String value}) = PasswordChanged;
  factory LoginEvent.changePasswordVisibility() = ChangePasswordVisibility;
  factory LoginEvent.loginButtonPressed() = LoginButtonPressed;


}