// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/widgets/loading/common_progress_dialog.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_keys.dart';
import 'package:srinivasa_crm_new/src/core/extensions/date_extension.dart';

import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_approxkilometer_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/state/daily_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/get/daily_plan_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/daily_plan_postModel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/delete_dailyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/update_dailyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/repo/daily_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_months_screen.dart';

import '../../../../Customer/domain/model/get/customer_model.dart';
import '../../../domain/model/monthly_plan_date_field.dart';
import '../../../domain/model/view_monthly_plan_model.dart';
import '../../monthly_plan_dashboard_screen.dart';

@injectable
class DailyPlanCubit extends Cubit<DailyPlanState> {
  final CustomerRepo customerRepo;
  final MonthlyPlanRepo monthlyPlanRepo;
  final DailyPlanRepo dailyPlanRepo;

  final dateController = TextEditingController();
  final kilometerController = TextEditingController();
  DailyPlanCubit(
    this.customerRepo,
    this.monthlyPlanRepo,
    this.dailyPlanRepo,
  ) : super(DailyPlanState.initial());


  clearAllController() {
    dateController.clear();
    kilometerController.clear();
  }



void getAllInitialValues() async {
  await Future.wait([
     getAllCustomers(),
  ]);
}

  Future<void>  getAllCustomers() async {
    final results = await  customerRepo.getCustomers();
    results.fold(
      (l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) {
        clearAllController();
        emit(state.copyWith(customerList: r.customermodel ?? []));
      },
    );
  }


  void pickDailyPlanDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      emit(state.copyWith(dateField: MonthlyPlanDateField(DateFormat('d-MM-yyyy').format(picked))));
      dateController.text = DateFormat('d-MM-yyyy').format(picked);
    }
    
  }


   void clearSelectedCustomerLists() {
    emit(state.copyWith(selectedCustomersList: []));

  }


  void setSelectedCustomerLists({required List<Customermodel> selectedCustomers}) {
    emit(state.copyWith(selectedCustomersList: selectedCustomers));
  }

  void addToExistingCustomers ({required List<Customermodel> custLists}) async {
  List<Customermodel> mergedList = [...state.customerList, ...custLists];
Map<String, Customermodel> uniqueMap = {};

for (var customer in mergedList) {
  uniqueMap[customer.customerName!] = customer;
}

List<Customermodel> resultList = uniqueMap.values.toList();
List<Customermodel> sortedList = List.from(resultList);
sortedList.sort((a, b) => a.customerName!.compareTo(b.customerName!));
emit(state.copyWith(customerList: sortedList));
  }


  void resetState() {
    clearAllController();
    clearSelectedCustomerLists();
    emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField('')));
    
  }

  Future<void> submit({required BuildContext context,required int monthlyPlanId,required bool isConfirmed,required VoidCallback voidCallback}) async {
     DailyPlan dailyPlan = DailyPlan(createdDate: dateController.text.toFormattedDate(), approxKms: double.tryParse(kilometerController.text) ?? 0.0 , customerCodes: [
                 state.selectedCustomersList.first.farm!.farmId.toString()

    ]);
    DailyPlanCreateModel dailyPlanCreateModel = DailyPlanCreateModel(monthlyPlanId: monthlyPlanId, dailyPlan: dailyPlan, confirmed: false);
   log(dailyPlanCreateModel.toJson().toString());
    
    ProgressDialogUtils.showProgressDialog(context: context);
    final results = await dailyPlanRepo.createDailyPlan(
      dailyPlanPostModel: dailyPlanCreateModel,
    );

    results.fold(
      (l) {
        ProgressDialogUtils.hideProgressDialog();
        emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
        Navigator.pop(context);
        if(context.mounted) {
          showDialog(
            barrierDismissible: false,
            context: context, builder: (c) => AlertDialog(
            title: Text('Error'),
            content: Text(ApiFailedModel.fromNetworkExceptions(l).message),
            actions: [
               TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('No')),
              TextButton(onPressed: () async {
                Navigator.pop(context);
                if(context.mounted) {
                
    DailyPlanCreateModel dailyPlanCreateModel = DailyPlanCreateModel(monthlyPlanId: monthlyPlanId, dailyPlan: dailyPlan, confirmed: true);
    ProgressDialogUtils.showProgressDialog(context: context);
    final results = await dailyPlanRepo.createDailyPlan(dailyPlanPostModel: dailyPlanCreateModel);
    results.fold((l) {
      Fluttertoast.showToast(msg: 'something went wrong');
      ProgressDialogUtils.hideProgressDialog();
      Navigator.pop(context);
    }, (r) {
      ProgressDialogUtils.hideProgressDialog();
      Fluttertoast.showToast(msg: 'Plan created successfully');
      Navigator.pop(context);
      Navigator.pushReplacement(context, ScaleRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: monthlyPlanId,)));
    });

                }
              }, child: Text('Yes')),
            ],
          ));
        }
      },
      (r) {
        ProgressDialogUtils.hideProgressDialog();
        voidCallback();
        Navigator.pop(context);
        QuickAlert.show(context: context, type: QuickAlertType.success, title: 'Success', text: 'Daily Plan Created Successfully');
      },
    );
  }

     // SET DATE
     // SET KILOMETER
       // SET CUSTOMER

       void setDate(String date) {
          emit(state.copyWith(dateField: MonthlyPlanDateField(date)));
          dateController.text= date;
       }

       void setKilometer(String kilometer) {
          emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(kilometer)));
          kilometerController.text= kilometer;
       }

      

        void setCustomers(List<Customermodel> customers) {
            emit(state.copyWith(selectedCustomersList: customers));
        }

        



// DELETE DAILY PLAN
Future<void> deleteDailyPlan({required BuildContext ctx,required DailyplanDeletePostModel dailyPlanDeletePostModel,required VoidCallback callback}) async {
  QuickAlert.show(context: ctx, type: QuickAlertType.loading, title: 'Loading', text: 'Deleting Daily Plan',disableBackBtn: false ,barrierDismissible: false,animType: QuickAlertAnimType.scale);
  final results = await dailyPlanRepo.deleteDailyPlan(dailyPlanDeletePostModel: dailyPlanDeletePostModel);
  results.fold((l) {
    ApiFailedModel apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
     Navigator.pop(ctx);
    
    if(ctx.mounted) {
    QuickAlert.show(context: ctx, type: QuickAlertType.error, title: 'Error', text: apiFailedModel.message,confirmBtnColor: Colors.black);


    }
  }, (r) {
    Navigator.pop(ctx);
    callback();

    
    if(ctx.mounted) {
    QuickAlert.show(context: ctx, type: QuickAlertType.success, title: 'Success', text: 'Daily Plan Deleted Successfully');

    }
  });
}


// Future<void> updateDailyPlan({required int monthlyPlanid,required int dailyPlanId,required BuildContext context,bool? isConfirmed = false,required VoidCallback errorCallback})async {
//   UpdateDailyPlanPostModel updateDailyPlanPostModel  = UpdateDailyPlanPostModel(monthlyPlanId: monthlyPlanid, dailyPlanId: dailyPlanId, actualKms: double.tryParse(kilometerController.text)?? 0.0 , customerCodes: state.selectedCustomersList.map((e) => e.farm!.farmId.toString()).toList(), confirmed: isConfirmed ?? false);
//   ProgressDialogUtils.showProgressDialog();
//   final resulsts = await dailyPlanRepo.updateDailyPlan(updateDailyPlanPostModel: updateDailyPlanPostModel);

//   resulsts.fold((l) {
//     ProgressDialogUtils.hideProgressDialog();
//    var apiFailedModel  =  ApiFailedModel.fromNetworkExceptions(l);
//     QuickAlert.show(context: context, type: QuickAlertType.error, title: 'Error', text:apiFailedModel.message,animType: QuickAlertAnimType.slideInDown );
//   }, (r) async {
//     ProgressDialogUtils.hideProgressDialog();
    
//     if(context.mounted) {
//       Navigator.pop(context);
//       if(context.mounted) {
//         Navigator.pop(context);
//         DailyPlanResponseModel dailyPlanResponseModel = DailyPlanResponseModel.fromJson(r.toJson());
//         if(dailyPlanResponseModel.status == false)    {
//            if(context.mounted) {
//  QuickAlert.show(context: context, type: QuickAlertType.confirm,title: 'Confirm',text: dailyPlanResponseModel.message,confirmBtnText: 'Yes',cancelBtnText: 'No',confirmBtnColor: Colors.black,onConfirmBtnTap: ()  async {

//     if(context.mounted) {
//       // here i want to close the exisitng open quick alert and want to show new quick alert on success tap i want to navigate to monthlyplandashbaordscreen

//       // ProgressDialogUtils.showProgressDialog();
//     }
//           //  await updateDailyPlan(monthlyPlanid: monthlyPlanid, dailyPlanId: dailyPlanId, context: context,isConfirmed: true);
//           });
//            }
         
//         }else {
//           Navigator.pop(context);
//           if(context.mounted) {
//             QuickAlert.show(context: context, type: QuickAlertType.success, title: 'Success', text: dailyPlanResponseModel.message);
//           }
//         }
//       }


//     }
//   });


// }
Future<void> updateDailyPlan({
  required int monthlyPlanid,
  required int dailyPlanId,
  required BuildContext context,
  bool? isConfirmed = false,
  required VoidCallback errorCallback,
}) async {
  UpdateDailyPlanPostModel updateDailyPlanPostModel = UpdateDailyPlanPostModel(
    monthlyPlanId: monthlyPlanid,
    dailyPlanId: dailyPlanId,
    actualKms: double.tryParse(kilometerController.text) ?? 0.0,
    customerCodes: state.selectedCustomersList.map((e) => e.farm!.farmId.toString()).toList(),
    confirmed: isConfirmed ?? false,
  );
  ProgressDialogUtils.showProgressDialog();
  final resulsts = await dailyPlanRepo.updateDailyPlan(updateDailyPlanPostModel: updateDailyPlanPostModel);

  resulsts.fold((l) {
    ProgressDialogUtils.hideProgressDialog();
    var apiFailedModel = ApiFailedModel.fromNetworkExceptions(l);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(apiFailedModel.message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: ()  {
                Navigator.of(context).pop();
               
              },
            ),
          ],
        );
      },
    );
  }, (r) async {
    ProgressDialogUtils.hideProgressDialog();

    if (context.mounted) {
      Navigator.pop(context);
      if (context.mounted) {
        Navigator.pop(context);
        DailyPlanResponseModel dailyPlanResponseModel = DailyPlanResponseModel.fromJson(r.toJson());
        if (dailyPlanResponseModel.status == false) {
          if (context.mounted) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirm'),
                  content: Text(dailyPlanResponseModel.message!),
                  actions: <Widget>[
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () async {
                        ProgressDialogUtils.showProgressDialog();
                         UpdateDailyPlanPostModel newupdateDailyPlanPostModel = UpdateDailyPlanPostModel(
    monthlyPlanId: monthlyPlanid,
    dailyPlanId: dailyPlanId,
    actualKms: double.tryParse(kilometerController.text) ?? 0.0,
    customerCodes: state.selectedCustomersList.map((e) => e.farm!.farmId.toString()).toList(),
    confirmed: true,
  );
                        final results = await dailyPlanRepo.updateDailyPlan(updateDailyPlanPostModel: newupdateDailyPlanPostModel,);
                        results.fold((l) {
                           ProgressDialogUtils.hideProgressDialog();
                          Fluttertoast.showToast(msg: 'something went wrong');
                          Navigator.pop(context);

                        }, (r) {
                          DailyPlanResponseModel dailyPlanResponseModel = DailyPlanResponseModel.fromJson(r.toJson());
                          if(dailyPlanResponseModel.status == true) {
                             ProgressDialogUtils.hideProgressDialog();
                          Fluttertoast.showToast(msg: 'Daily Plan Updated Successfully',backgroundColor: Colors.green,textColor: Colors.white);
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, ScaleRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: monthlyPlanid,)));
                          }else {
                                 ProgressDialogUtils.hideProgressDialog();
                          Fluttertoast.showToast(msg: 'something went wrong');
                          Navigator.pop(context);

                          }

                        });
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else {
          Navigator.pop(context);
          if (context.mounted) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success'),
                  content: Text(dailyPlanResponseModel.message!),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    }
  });
}



@override
  Future<void> close() {
    dateController.dispose();
    kilometerController.dispose();
    return super.close();
  }



}
