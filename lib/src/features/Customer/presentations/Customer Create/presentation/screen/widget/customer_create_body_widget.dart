import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_addation_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_linetwo_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_approved_customer_dropdown_widget.dart';
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
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_farm_capacity_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_farm_name_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_fax_number_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mandal_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mobile_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_name_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_phone_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_pincode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_primary_source_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_state_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_title_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_zone_dropdown_widget.dart';

import 'cc_locality_dropdown_widget.dart';

class CustomerCreateBodyWidget extends StatelessWidget {
  const CustomerCreateBodyWidget({super.key}); 

  @override
  Widget build(BuildContext context) {
    return context.watch<CustomerCreateCubit>().state.isSubmitting == true ? const   CustomLoadingWidget() : SingleChildScrollView(
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
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CUSTOMER NAME
                context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     20.verticalSpace,
                                context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const CommonTextFieldHeadingWidget(title: "Existing Customer",isRequired: true,) :     const SizedBox.shrink(),

                context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? context.watch<CustomerCreateCubit>().state.isCustomerCodeLoading ? const DropdownLoadingWidget() :  const CCApprovedCustomerDropdownWidget() :       const SizedBox.shrink(),
                context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     20.verticalSpace,
        context.watch<CustomerCreateCubit>().state.isBusinessPartner == true ? const SizedBox.shrink() :       20.verticalSpace,
                            const CommonTextFieldHeadingWidget(title: "Title",isRequired: true,),

              const CCTitleDropDownWidget(),
          context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     20.verticalSpace,
                    context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CommonTextFieldHeadingWidget(title: 'Customer Name',isRequired: true,),

         context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CCNameTextFieldWidget(),
         context.read<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :      20.verticalSpace,
                             context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CommonTextFieldHeadingWidget(title: 'Customer Phone',isRequired: true,),

              // CUSTOMER PHONE
          context.read<CustomerCreateCubit>().state.isBusinessPartner == false ? const SizedBox.shrink() :     const CCPhoneTextFieldWidget(),
           
              20.verticalSpace,
              // CUSTOMER TITLE
              // CUSTOMER CONTACT PERSON
              const CommonTextFieldHeadingWidget(title: "Contact Person Name",isRequired: true,),
              const CCContactPersonTextField(),
              20.verticalSpace,
              // CUSTOMER MOBILE
                            const CommonTextFieldHeadingWidget(title: "Contact Mobile Number",isRequired: true,),

              const CCMobileTextFieldWidget(),
              20.verticalSpace,
              // CUSTOMER EMAIL
                                          const CommonTextFieldHeadingWidget(title: "Email",isRequired: true,),

              const CCEmailTextFieldWidget(),
                 // CUSTOMER ADDITIONAL FIELD
              20.verticalSpace,
                                                      const CommonTextFieldHeadingWidget(title: "Additional Phone",isRequired: false,),

              const CCAdditionalPhoneTextField(),

              // CUSTOMER CUSTOMER-TYPE
              20.verticalSpace,
                                                        const CommonTextFieldHeadingWidget(title: "Customer Type",isRequired: true,),

              const CCCustomerTypeDropDownWidget(),
              // DIVISONS DROPDOWN
              20.verticalSpace,
                                                                      const CommonTextFieldHeadingWidget(title: "Division",isRequired: true,),

              state.isDivisionLoading ? const DropdownLoadingWidget() : const CCDivisionDropDownWidget(),

              // CUSTOMR ZONE ID
              20.verticalSpace,
                                                                                    const CommonTextFieldHeadingWidget(title: "Zone",isRequired: true,),

            state.zoneLoading ? const DropdownLoadingWidget() :  const CCZoneDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER ASSIGNED TO DROPDOWN
                                                                                    const CommonTextFieldHeadingWidget(title: "Assign To",isRequired: true,),

          context.watch<CustomerCreateCubit>().state.isLoading ? const DropdownLoadingWidget() :    const CCAssignedToDropDownWidget(),

              20.verticalSpace,
                                                                                    const CommonTextFieldHeadingWidget(title: "Primary Source",isRequired: true,),

             state.primarySourceLoading ? const DropdownLoadingWidget() :  const CCPrimarySourceDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER COUNTRY ID
                                                                                    const CommonTextFieldHeadingWidget(title: "Country",isRequired: true,),

            state.countryLoading ? const DropdownLoadingWidget() :   const CCCountiresDropDownWidget(),
              20.verticalSpace,
 const CommonTextFieldHeadingWidget(title: "State",isRequired: true,),

            state.stateLoading ? const DropdownLoadingWidget() :   const CCStateDropDownWidget(),
              20.verticalSpace,
              // CUSTOMRE DIVISION DROPDOWN
               const CommonTextFieldHeadingWidget(title: "District",isRequired: true,),


           state.districtLoading ? const DropdownLoadingWidget() :    const CCDistrictDropDownWidget(),
              // CUSTOMER MANDAM DROPDOWN
              20.verticalSpace,
               const CommonTextFieldHeadingWidget(title: "Mandal",isRequired: true,),

              const CCMandalTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER CITY TEXTFIELD
               const CommonTextFieldHeadingWidget(title: "City",isRequired: true,),

              state.isCityLoading ? const DropdownLoadingWidget() : const CCCityDropDownWidget(),
              // const CCCityTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER LOCALITY
              // const CCLocalityTextFieldWidget(),
               const CommonTextFieldHeadingWidget(title: "Locality",isRequired: true,),

              state.isLocalityLoading ? const DropdownLoadingWidget() : const CCLocalityDropDownWidget(),
              20.verticalSpace,
              // CUSTOMER ADDRESS
               const CommonTextFieldHeadingWidget(title: "Address",isRequired: true,),

              const CCAddressTextFieldWidget(),
              20.verticalSpace,

              // CUSTOMER ADDRESSS LINE TWO
               const CommonTextFieldHeadingWidget(title: "Address Line Two",isRequired: true,),

              const CCAddressLineTwoTextFieldWidget(),
              // CUSTOMER PINCODE
              20.verticalSpace,
               const CommonTextFieldHeadingWidget(title: "Pincode",isRequired: true,),

              const CCPincodeTextField(),
              // CUSTOMER CREDIT LIMIT
              20.verticalSpace,
               const CommonTextFieldHeadingWidget(title: "Credit Limit (Optional)",isRequired: false,),

              const CCCreditLimitTextField(),
              20.verticalSpace,
                             const CommonTextFieldHeadingWidget(title: "Fax number (Optional)",isRequired: false,),

            const CCFaxNumberField(),
            20.verticalSpace,
                           const CommonTextFieldHeadingWidget(title: "Farm Capacity",isRequired: true,),

            const CCFarmCapacityTextField(),


                context.watch<CustomerCreateCubit>().state.isBusinessPartner == true ? const SizedBox.shrink() :     20.verticalSpace,
                                context.watch<CustomerCreateCubit>().state.isBusinessPartner == false ? const CommonTextFieldHeadingWidget(title: "Farm Name",isRequired: true,) :     const SizedBox.shrink(),
                                   context.watch<CustomerCreateCubit>().state.isBusinessPartner == true ? const SizedBox.shrink() :     const CCFarmNameTextFieldWidget(),
                context.watch<CustomerCreateCubit>().state.isBusinessPartner == true ? const SizedBox.shrink() :     20.verticalSpace,
                20.verticalSpace,
         state.isSubmitting ? const CustomLoadingWidget() :     CommonButton(
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
