// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';

import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/image_full_screen.dart';

import '../../../../../../common/common.dart';
import '../../cubit/kyc_upload_cubit.dart';
import '../../cubit/kyc_upload_state.dart';

class UploadContainerWidget extends StatelessWidget {
  final VoidCallback onAdharCardFrontUpload;
  final VoidCallback onAdharCardBackUpload;
  final VoidCallback onPanCardUpload;
  final bool isAdharCardContainer;
  const UploadContainerWidget({
    super.key,
    required this.onAdharCardFrontUpload,
    required this.onAdharCardBackUpload,
    required this.onPanCardUpload,
    required this.isAdharCardContainer,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KycUploadCubit, KycUploadState>(
      builder: (context, state) {
        return Container(
          height: 0.2.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // front side
              Expanded(
                  child:  state.panFile != null && isAdharCardContainer == false ? KycImageWidget(bytes: state.panFile!.imageByes, onTapFunction: () => context.read<KycUploadCubit>().removePanFile()) :
                  
                  
                state.adharFileFront != null && isAdharCardContainer == true ? KycImageWidget(bytes: state.adharFileFront!.imageByes, onTapFunction: () { context.read<KycUploadCubit>().removeAdharFileFront(); },) :   InkWell(
                splashColor: AppColors.primaryColor,
                onTap: isAdharCardContainer == true
                    ? onAdharCardFrontUpload
                    : onPanCardUpload,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                      title: isAdharCardContainer == true
                          ? "Upload Front"
                          : "Upload Pancard",
                      fontWeight: FontWeight.w500,
                      textSize: 18.sp,
                      textColor: Colors.black.withOpacity(0.5),
                      maxLines: 1,
                    ),
                    10.verticalSpace,
                    const Icon(Icons.upload_file),
                  ],
                ),
              )),
              isAdharCardContainer == true
                  ? const FractionallySizedBox(
                      heightFactor: 0.8,
                      child: VerticalDivider(
                        color: Colors.grey,
                      ))
                  : const SizedBox.shrink(),

              // front side
              isAdharCardContainer == true
                  ? state.adharFileBack != null && isAdharCardContainer == true ? Expanded(child: KycImageWidget(bytes: state.adharFileBack!.imageByes, onTapFunction: () { context.read<KycUploadCubit>().removeAdharFileBack(); },))  : Expanded(
                      child: InkWell(
                      splashColor: AppColors.primaryColor,
                      onTap: onAdharCardBackUpload,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            title: "Upload Back",
                            fontWeight: FontWeight.w500,
                            textSize: 18.sp,
                            textColor: Colors.black.withOpacity(0.5),
                            maxLines: 1,
                          ),
                          10.verticalSpace,
                          const Icon(Icons.upload_file),
                        ],
                      ),
                    ))
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}



class KycImageWidget extends StatelessWidget {
  final Uint8List bytes;
  final VoidCallback onTapFunction;
  const KycImageWidget({
    Key? key,
    required this.bytes,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.center,
      widthFactor: 1.0,heightFactor: 1.0 ,child: Center(
        child: Stack(
          children: [
            Padding(
               padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
              child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, ScaleRoute(screen: ImageFullScreen(bytes: bytes)));
                              },
                              child: Image.memory(bytes,fit: BoxFit.fitWidth,))),
            ),

                          // POSITION WIDGET 
                            Positioned(
          right: 2,
          top: 2,
          child: InkWell(
            onTap: onTapFunction,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
          ],
        ),
      ));
  }
}
