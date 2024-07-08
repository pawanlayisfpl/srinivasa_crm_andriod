import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_addation_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_linetwo_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_address_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_assigned_to_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_city_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_contact_person_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_countires_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_credit_limit_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_customerTypes_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_divison_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_email_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mandal_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_mobile_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_name_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_phone_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_pincode_textfield_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_state_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_title_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/screen/widget/cc_zone_dropdown_widget.dart';

import 'cc_customer_locality_textfield.dart';


class CustomerCreateBodyWidget extends StatelessWidget {
  const CustomerCreateBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child:  Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        // CUSTOMER NAME
       20.verticalSpace,
       const CCTitleDropDownWidget(),
       20.verticalSpace,
        const CCNameTextFieldWidget(),
        20.verticalSpace,
        // CUSTOMER PHONE
        const  CCPhoneTextFieldWidget(),
        // CUSTOMER ADDITIONAL FIELD
        20.verticalSpace,

       const  CCAdditionalPhoneTextField(),
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
        

        // CUSTOMER PRIMARY SOURCE DROPDOWN

        // CUSTOMR ZONE ID
        20.verticalSpace,
        const CCZoneDropDownWidget(),
        // CUSTOMER CUSTOMER-TYPE
        20.verticalSpace,
        const CCCustomerTypeDropDownWidget(),
 
     
        20.verticalSpace,
        // CUSTOMER ASSIGNED TO DROPDOWN
        const CCAssignedToDropDownWidget(),
        20.verticalSpace,
        // CUSTOMER COUNTRY ID
       const  CCCountiresDropDownWidget(),
        20.verticalSpace,
        const CCStateDropDownWidget(),
        20.verticalSpace,
        // CUSTOMRE DIVISION DROPDOWN

          const CCDivisionDropDownWidget(),
             // CUSTOMER MANDAM DROPDOWN
        20.verticalSpace,
        const CCMandalTextFieldWidget(),
        20.verticalSpace,
        
        // CUSTOMER CITY TEXTFIELD
        const CCCityTextFieldWidget(),
        20.verticalSpace,
      

        // CUSTOMER LOCALITY
        const  CCLocalityTextFieldWidget(),
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
        CommonButton(callback: () async {
          QuickAlert.show(context: context, type: QuickAlertType.info, title: "Warning", text: "Are you sure want to create new customer?"
          ,showCancelBtn: true,
          confirmBtnText: 'Yes',
          onConfirmBtnTap: () async {
            Navigator.pop(context);

            if(context.mounted) {
             context.read<CustomerCreateCubit>().formSubmit();


            }
          },
          onCancelBtnTap: () {
            Navigator.of(context).pop();
          },
          


          );
        }, title: "Submit"),
        10.verticalSpace,
       
      ],),
    );
  }
}