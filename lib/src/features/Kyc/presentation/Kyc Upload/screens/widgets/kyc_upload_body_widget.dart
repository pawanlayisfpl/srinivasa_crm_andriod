// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/cubit/kyc_upload_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/widgets/upload_contianer_widget.dart';

import '../../../../domain/model/customer_kyu_model.dart';
import '../../cubit/kyc_upload_state.dart';
import 'pancard_image_widget.dart';

class KycUploadBodyWidget extends StatelessWidget {
  final CustomerKycModel? customerKycModel;
  const KycUploadBodyWidget({
    super.key,
    required this.customerKycModel,
  });

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
            ).withSymetricPadding(horizontalPadding: 10.w),
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
            10.verticalSpace,
             CommonTextWidget(
              title: "Adhar Number",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
            5.verticalSpace,
            // AADHAR CARD NUMBER
              CommonTextfield(
              textEditingController: context.read<KycUploadCubit>().adharCardController,
              onChanged: (v) => {},
              validator: (v) => {},
              hintText: "Enter your adhar card number",
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: false,
            ),
            10.verticalSpace,
            // ADHAR CARD FILE
            CommonTextWidget(
              title: "Aadhar File",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
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
                  10.verticalSpace,
            // PAN CARD NUMBER
            10.verticalSpace,
            // ADHAR CARD FILE
            CommonTextWidget(
              title: "PanCard Number",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
            5.verticalSpace,
              CommonTextfield(
              textEditingController: context.read<KycUploadCubit>().panCardController,
              onChanged: (v) => {},
              validator: (v) => {},
              hintText: "Enter your pan card number",
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: false,
            ),
            10.verticalSpace,
            
            // PANDCARD FILE START HERE
            CommonTextWidget(
              title: "PanCard File",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
            10.verticalSpace,
            UploadContainerWidget(
                onAdharCardFrontUpload: () {},
                onAdharCardBackUpload: () {},
                onPanCardUpload: () async {
                  await context.read<KycUploadCubit>().getPanFile();
                },
                isAdharCardContainer: false),
            // PANCARD FILE ENDS HERE
            20.verticalSpace,
            // GST FILE
              CommonTextWidget(
              title: "GST Number",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
            5.verticalSpace,
              CommonTextfield(
              textEditingController: context.read<KycUploadCubit>().gstController,
              onChanged: (v) => {},
              validator: (v) => {},
              hintText: "Enter your GST number",
              autovalidateMode: AutovalidateMode.disabled,
              readOnly: false,
            ),
            10.verticalSpace,
               CommonTextWidget(
              title: "GST File",
              fontWeight: FontWeight.w500,
              textSize: 20.sp,
            ).withSymetricPadding(horizontalPadding: 10.w),
            5.verticalSpace,
            Center(
              child: InkWell(
                splashColor: AppColors.primaryColor,
                
                onTap: context.watch<KycUploadCubit>().state.gstFile == null ? () {
                  context.read<KycUploadCubit>().getGSTFile();
                } : null,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  height: 0.2.sh,
                  width: 0.9.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black,width: 1)),
                  child: context.watch<KycUploadCubit>().state.gstFile != null ? Stack(
                    children: [
                      const PancardImageWidget(),

                      // Image.memory(context.read<KycUploadCubit>().state.gstFile!.imageByes,fit: BoxFit.cover,),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                          context.read<KycUploadCubit>().removeGstFile();
                        },
                          child: const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.delete,color: Colors.white,)),
                        ))
                    ],
                  ) : Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
                    const CommonTextWidget(title: 'Upload Gst File',textColor: Colors.grey,),
                    5.verticalSpace,
                    const Icon(Icons.upload),
                  ],),
                ),
              ),
            ),
            20.verticalSpace,
            CommonButton(
              callback: () {
                context.read<KycUploadCubit>().submitKyc(customerid: customerKycModel?.customerId ?? "", successCallback: () { 
                  Navigator.pop(context);
                 });
              },
              title: "Submit",
            ),
            30.verticalSpace,
          ],
        ).withSymetricPadding(horizontalPadding: 20.w),
      ),
    );
  }
}
