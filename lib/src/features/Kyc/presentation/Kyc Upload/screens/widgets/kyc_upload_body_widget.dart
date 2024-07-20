// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/widgets/upload_contianer_widget.dart';

import '../../../../domain/model/customer_kyu_model.dart';
import '../../cubit/kyc_upload_state.dart';

class KycUploadBodyWidget extends StatelessWidget {
  final CustomerKycModel? customerKycModel;
  const KycUploadBodyWidget({
    Key? key,
    required this.customerKycModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<KycUploadCubit, KycUploadState>(
      listenWhen: (previous, current) => previous.errorMessage != current.errorMessage || previous.isSubmitting != current.isSubmitting ||  previous.isSuccess != current.isSuccess,
      listener: (context, state) {

        if(state.isLoading) {
          QuickAlert.show(context: context, type: QuickAlertType.loading, title: "Loading",barrierDismissible: false,confirmBtnColor: Colors.black);
        }

        if(state.isSubmitting) {
          QuickAlert.show(context: context, type: QuickAlertType.loading, title: "Submitting",barrierDismissible: false,confirmBtnColor: Colors.black);
        }

        if(state.errorMessage != null) {
          if(Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          QuickAlert.show(context: context, type: QuickAlertType.error, title: state.errorMessage,barrierDismissible: false,confirmBtnColor: Colors.black);
        }


        if(state.isSuccess) {
          if(Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          if(context.mounted) {
            Navigator.pop(context);
          }
          QuickAlert.show(context: context, type: QuickAlertType.success, title: "KYC Submitted Successfully",barrierDismissible: false,confirmBtnColor: Colors.black);
        }

      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            CommonTextWidget(
              title: "Enter Your Details",
              fontWeight: FontWeight.w500,
              textSize: 30.sp,
            ),
            20.verticalSpace,
            CommonTextWidget(
              title: "Name",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ),
            10.verticalSpace,
            CommonTextfield(
              textEditingController: TextEditingController(text: customerKycModel?.customerName),
              onChanged: (v) => {},
              validator: (v) => {},
              labelText: "",
              hintText: "",
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: true,
            ),
            30.verticalSpace,
            // ADHAR CARD FILE
            CommonTextWidget(
              title: "Aadhar File",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ),
            10.verticalSpace,
            UploadContainerWidget(
                onAdharCardFrontUpload: () async {
                  await context.read<KycUploadCubit>().getAdharFileFront();
                },
                onAdharCardBackUpload: () async {
                  await context.read<KycUploadCubit>().getAdharFileBack();
                },
                onPanCardUpload: () {},
                isAdharCardContainer: true),
            20.verticalSpace,
            // PANDCARD FILE START HERE
            CommonTextWidget(
              title: "PanCard File",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ),
            10.verticalSpace,
            UploadContainerWidget(
                onAdharCardFrontUpload: () {},
                onAdharCardBackUpload: () {},
                onPanCardUpload: () async {
                  await context.read<KycUploadCubit>().getPanFile();
                },
                isAdharCardContainer: false),
            // PANCARD FILE ENDS HERE
            30.verticalSpace,
            CommonButton(
              callback: () {
                context.read<KycUploadCubit>().submitKyc();
              },
              title: "Submit",
            )
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
