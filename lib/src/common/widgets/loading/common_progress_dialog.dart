import 'package:flutter/material.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_keys.dart';

class ProgressDialogUtils {
  static bool isProgressValue = false;

  static void showProgressDialog({BuildContext?  context,bool isCancellable = false}) async  {
    if(!isProgressValue && AppKeys.globalNavigatorKey.currentState?.overlay?.context != null) {
      isProgressValue = true;

showDialog(
  barrierDismissible: false,
  context: AppKeys.globalNavigatorKey.currentState!.overlay!.context, builder: (BuildContext context) {
  return const Center(child:  CircularProgressIndicator.adaptive(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  
    ),);
});

    }
  }

  // static void hideProgressDialog() {
  //   if(isProgressValue) {
  //     Navigator.of(AppKeys.globalNavigatorKey.currentState!.overlay!.context).pop();
  //     isProgressValue = false;
  //   }
  // }

  static void hideProgressDialog() {
  print('hideProgressDialog called');
  if (isProgressValue) {
    print('isProgressValue is true');
    final navigator = Navigator.of(AppKeys.globalNavigatorKey.currentState!.overlay!.context);
    if (navigator.canPop()) {
      navigator.pop();
      print('Dialog popped');
    } else {
      print('Navigator cannot pop');
    }
    isProgressValue = false;
  } else {
    print('isProgressValue is false');
  }
}
}

