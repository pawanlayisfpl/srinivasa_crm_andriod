import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_addation_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_linetwo_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_assigned_to_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_city_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_city_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_contact_person_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_countires_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_credit_limit_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_customerTypes_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_district_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_divison_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_email_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mandal_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mobile_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_name_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_phone_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_pincode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_primary_source_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_state_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_title_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_zone_dropdown_widget.dart';

import 'cc_customer_locality_textfield.dart';
import 'cc_locality_dropdown_widget.dart';

class CustomerCreateBodyWidget extends StatelessWidget {
  const CustomerCreateBodyWidget({super.key}); 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: BlocConsumer<CustomerCreateCubit, CustomerCreateState>(
        listenWhen: (previous, current) {
          return previous.isSuccess != current.isSuccess ||
                 (previous.apiFailedModel == null && current.apiFailedModel != null) ||
                 (previous.apiFailedModel != null && current.apiFailedModel == null) ||
                 previous.isLoading != current.isLoading;
        },
        builder: (context, state) {
          return state.isSubmitting == true ? const  Center(child: CustomLoadingWidget()) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CUSTOMER NAME
              20.verticalSpace,
              const CCTitleDropDownWidget(),
          context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     20.verticalSpace,
         context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CCNameTextFieldWidget(),
         context.read<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :      20.verticalSpace,
              // CUSTOMER PHONE
          context.read<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CCPhoneTextFieldWidget(),
           
              20.verticalSpace,
              // CUSTOMER TITLE
              // CUSTOMER CONTACT PERSON
              const CCContactPersonTextField(),
              20.verticalSpace,
              // CUSTOMER MOBILE
              const CCMobileTextFieldWidget(),
              20.verticalSpace,
              // CUSTOMER EMAIL
              const CCEmailTextFieldWidget(),
                 // CUSTOMER ADDITIONAL FIELD
              20.verticalSpace,

              const CCAdditionalPhoneTextField(),

              // CUSTOMER CUSTOMER-TYPE
              20.verticalSpace,
              const CCCustomerTypeDropDownWidget(),
              // DIVISONS DROPDOWN
              20.verticalSpace,
              state.isDivisionLoading ? const DropdownLoadingWidget() : CCDivisionDropDownWidget(),

              // CUSTOMR ZONE ID
              20.verticalSpace,
            state.zoneLoading ? const DropdownLoadingWidget() :  const CCZoneDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER ASSIGNED TO DROPDOWN
              const CCAssignedToDropDownWidget(),

              20.verticalSpace,
             state.primarySourceLoading ? const DropdownLoadingWidget() :  CCPrimarySourceDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER COUNTRY ID
            state.countryLoading ? const DropdownLoadingWidget() :   const CCCountiresDropDownWidget(),
              20.verticalSpace,
            state.stateLoading ? const DropdownLoadingWidget() :   const CCStateDropDownWidget(),
              20.verticalSpace,
              // CUSTOMRE DIVISION DROPDOWN

           state.districtLoading ? const DropdownLoadingWidget() :    const CCDistrictDropDownWidget(),
              // CUSTOMER MANDAM DROPDOWN
              20.verticalSpace,
              const CCMandalTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER CITY TEXTFIELD
              state.isCityLoading ? const DropdownLoadingWidget() : const CCCityDropDownWidget(),
              // const CCCityTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER LOCALITY
              // const CCLocalityTextFieldWidget(),
              state.isLocalityLoading ? const DropdownLoadingWidget() : const CCLocalityDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER ADDRESS
              const CCAddressTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER ADDRESSS LINE TWO
              const CCAddressLineTwoTextFieldWidget(),
              // CUSTOMER PINCODE
              20.verticalSpace,
              const CCPincodeTextField(),
              // CUSTOMER CREDIT LIMIT
              20.verticalSpace,
              const CCCreditLimitTextField(),
              20.verticalSpace,
         state.isSubmitting ? CustomLoadingWidget() :     CommonButton(
                  callback: () async {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      title: "Warning",
                      text: "Are you sure want to create new customer?",
                      showCancelBtn: true,
                      confirmBtnText: 'Yes',
                      onConfirmBtnTap: () async {
                        Navigator.pop(context);

                        if (context.mounted) {
                          context.read<CustomerCreateCubit>().formSubmit();
                        }
                      },
                      onCancelBtnTap: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  title: "Submit"),
              10.verticalSpace,
            ],
          );
        }, listener: (BuildContext context, CustomerCreateState state) { 
          if(state.isSubmitting) {
            QuickAlert.show(
              barrierDismissible: true,
              context: context,
              type: QuickAlertType.loading,
              title: "Loading",
              text: "Please wait...",
            );
          }

          if(state.apiFailedModel != null) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: "(${state.apiFailedModel!.statusCode})${state.apiFailedModel!.message}",
              text: state.apiFailedModel!.errorMessage.toString(),
            );
          }
          

        if (state.isSuccess) {
    Navigator.pop(context);

  if (context.mounted) {
    Fluttertoast.showToast(msg: 'Customer created successfuly',backgroundColor: AppColors.greenColor,textColor: Colors.white);
    // Future.delayed(Duration.zero, () {
    //   QuickAlert.show(
    //     context: context,
    //     barrierDismissible: false,
    //     onConfirmBtnTap: () => Navigator.pop(context),
    //     type: QuickAlertType.success,
    //     title: "Success",
    //     text: "Customer created successfully",
    //   );
    // });
  }
}
         },
      ),
    );
  }
}
