// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Purpose/purpose_model.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkout_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/cubit/checkin_state.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/widgets/checkout_purpose_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/Kyc%20Upload/screens/image_full_screen.dart';

import '../../../../../../shared/domain/model/Image/image_model.dart';
import '../../../../../config/config.dart';
import '../../../domain/model/get/customer_model.dart';

class CheckoutScreen extends StatefulWidget {
  final Customermodel customermodel;

  const CheckoutScreen({
    super.key,
    required this.customermodel,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _descrtiptionController = TextEditingController();
  final _othersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      debugPrint('CHECKOUT SCREEN INIT MEHTOD');
      context.read<CheckinCubit>().resetCheckoutState();
      await context.read<CheckinCubit>().getAllPurposeLists();

      //  await context.read<CheckinProvider>().getAllInitialValues();
    });
  }

  @override
  void dispose() {
    _descrtiptionController.dispose();
    _othersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckinCubit, CheckinState>(
    listener: (context, state) {
        if (state.isFailed) {
          QuickAlert.show(
              context: context,
              disableBackBtn: true,
              type: QuickAlertType.error,
              title:
                  "(${state.apiFailedModel!.statusCode})${state.apiFailedModel!.message}",
              text: state.apiFailedModel!.errorMessage.toString());
        }
        if (state.isCheckOut) {
          if (context.mounted) {
            Navigator.pop(context);
            if (context.mounted) {
              QuickAlert.show(
                  context: context,
                  disableBackBtn: true,
                  type: QuickAlertType.success,
                  title: "Checkout",
                  text: "Checkout Successfully");
            }
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout screen'),
          actions: [
            const FractionallySizedBox(
                heightFactor: 0.5,
                child: VerticalDivider(
                  color: Colors.white,
                )),
            SizedBox(
                height: 30.h,
                child: ElevatedButton.icon(
                    onPressed: () async {

                      if(context.mounted) {

                         final locationServicesss = locator.get<CommonLocationServices>();
                              Position position = await locationServicesss.getUserCurrentPosition();
                              double lat = position.latitude;
                              double long = position.longitude;
                      
                      if (context
                                  .read<CheckinCubit>()
                                  .state
                                  .lastCheckinOutResponseModel !=
                              null &&
                          context.read<CheckinCubit>().state.selectedPurpose !=
                              null) {
                        debugPrint(context
                            .read<CheckinCubit>()
                            .state
                            .lastCheckinOutResponseModel!
                            .toJson()
                            .toString());
                        List<int> userIds = context
                                    .read<CheckinCubit>()
                                    .state
                                    .lastCheckinOutResponseModel ==
                                null
                            ? []
                            : context
                                .read<CheckinCubit>()
                                .state
                                .lastCheckinOutResponseModel!
                                .users!
                                .map((e) => int.parse(e.toString()))
                                .toList();
                        PurposeModel purposeModel =
                            context.read<CheckinCubit>().state.selectedPurpose!;
                        List<ImageModel> imageLists =
                            context.read<CheckinCubit>().state.imageLists;
                        List<FileModel> filesList =
                            context.read<CheckinCubit>().state.filesList;

                        CheckoutPostModel checkoutPostModel = CheckoutPostModel(
                          userIds: userIds,
                          customerId: widget.customermodel.farm!.customerId.toString(),
                          farmId: widget.customermodel.farm!.farmId.toString(),
                         
                          customerName: widget.customermodel.customerName,
                          langitude: lat.toString(),
                          latitude: long.toString(),
                          purposeId: purposeModel.purposeId.toString(),
                          remarks: _descrtiptionController.text.toString(),
                          files: filesList.map((e) => e.fileBytes).toList(),
                          images: imageLists.map((e) => e.imageByes).toList(),
                        );
                      if(context.mounted) {
                           await context.read<CheckinCubit>().checkoutLogic(
                            checkOutPostModel: checkoutPostModel,context: context);
                      }
                      } else {
                        debugPrint('last checkin response model is getting null');
                        Fluttertoast.showToast(
                            msg: 'Please select purpose',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_LONG);
                      }
                      }
                    },
                    icon: const Icon(
                      Icons.check_circle_outline_outlined,
                      color: AppColors.primaryColor,
                    ),
                    label: CommonTextWidget(
                      title: 'Submit',
                      textColor: AppColors.primaryColor,
                      textSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ))),
            10.horizontalSpace,
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 20.h),
              const CommonTextWidget(
                title: 'Please fill the details below',
                fontWeight: FontWeight.w500,
                textColor: Colors.grey,
              ),
              const Divider(),
              10.verticalSpace,
              // const CheckoutPurposeDropDownWidget(),
              const CheckoutPurposeDropDownWidget(),
              25.verticalSpace,
              context.watch<CheckinCubit>().state.selectedPurpose != null &&
                      context
                              .watch<CheckinCubit>()
                              .state
                              .selectedPurpose!
                              .purposeName
                              .toString() ==
                          'Others'
                  ? CommonTextfield(
                      maxLines: 1,
                      textEditingController: _othersController,
                      onChanged: (String? value) {},
                      validator: (val) {},
                      labelText: 'Purpose*',
                      hintText: 'Enter your purpose',
                      autovalidateMode: AutovalidateMode.disabled)
                  : const SizedBox.shrink(),
              25.verticalSpace,
              TextFormField(
                enabled: true,
                readOnly: true,
                initialValue: widget.customermodel.customerName,
                decoration: InputDecoration(
                    labelText: 'Customer Name',
                    labelStyle: AppStyles.labelStyle,
                    border: AppStyles.inputBorder,
                    focusedBorder: AppStyles.focusBorder),
              ),
              20.verticalSpace,
              CommonTextfield(
                  maxLines: 5,
                  textEditingController: _descrtiptionController,
                  onChanged: (String? value) {},
                  validator: (val) {},
                  labelText: 'Description*',
                  hintText: 'Enter your description',
                  autovalidateMode: AutovalidateMode.disabled),

              20.verticalSpace,
              const CustomHeadingTextWidget(
                title: 'Attachments',
                textColor: AppColors.primaryColor,
              ),
              10.verticalSpace,
              InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                },
                splashColor: Colors.grey[200],
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: ListTile(
                 onTap: () => pickImages(context),
                    dense: false,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    leading: const Icon(Icons.image),
                    title: const Text('Click to attach images', maxLines: 1),
                  ),
                ),
              ),
              15.verticalSpace,
              context.watch<CheckinCubit>().state.imageLists.isEmpty
                  ? const SizedBox.shrink()
                  : IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: CommonTextWidget(
                                  title: context
                                          .watch<CheckinCubit>()
                                          .state
                                          .imageLists
                                          .isEmpty
                                      ? 'No files selected'
                                      : 'Selected files: ${context.watch<CheckinCubit>().state.imageLists.length}',
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  textSize: 12.sp)),
                          Expanded(
                              flex: 5,
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<CheckinCubit>()
                                        .clearImageLists();
                                  },
                                  child: CommonTextWidget(
                                    title: 'Clear All',
                                    textColor: Colors.red,
                                    textSize: 12.sp,
                                    align: TextAlign.end,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      ),
                    ),
              context.watch<CheckinCubit>().state.imageLists.isEmpty
                  ? const SizedBox.shrink()
                  : 10.verticalSpace,
              context.watch<CheckinCubit>().state.imageLists.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 0.25.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return InkWell(
                            splashColor: Colors.grey[200],
                            onTap: () {
                              HapticFeedback.lightImpact();
                              Navigator.push(context, ScaleRoute(screen: ImageFullScreen(bytes: context
                                        .read<CheckinCubit>()
                                        .state
                                        .imageLists[i]
                                        .imageByes,)));
                            },
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.memory(
                                    context
                                        .watch<CheckinCubit>()
                                        .state
                                        .imageLists[i]
                                        .imageByes,
                                    height: 0.25.sh,
                                    width: 0.45.sw,
                                    fit: BoxFit.cover,
                                  ),
                                ).withSymetricPadding(horizontalPadding: 8.w),
                                GestureDetector(
                                  onTap: () {
                                    context.read<CheckinCubit>().removeImage(
                                        image: context
                                            .read<CheckinCubit>()
                                            .state
                                            .imageLists[i]);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 15.w, top: 10.h),
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20.sp,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: context
                            .watch<CheckinCubit>()
                            .state
                            .imageLists
                            .length,
                      ),
                    ),
              15.verticalSpace,
              InkWell(
              onTap: context.watch<CheckinCubit>().state.filesList.isEmpty ?  () {
                  HapticFeedback.lightImpact();
                  if (mounted) {
                    // TODO: ADD CAMRA IMAGE UPLOAD ALSO
                    context.read<CheckinCubit>().pickAllFiles();
                    // context.read<CheckinProvider>().pickFiles();
                  }
                } : () async {
                  HapticFeedback.lightImpact();
                  if (mounted) {
                    context.read<CheckinCubit>().pickOneMoreFile();
                  }
                },
                splashColor: Colors.grey[200],
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: ListTile(
                    dense: false,
                    contentPadding: EdgeInsets.only(left: 10.w),
                    leading: const Icon(Icons.picture_as_pdf),
                    title: const Text('Click to attach files', maxLines: 1),
                  ),
                ),
              ),
              15.verticalSpace,
              // FILE LIST  UI
              context.watch<CheckinCubit>().state.filesList.isEmpty
                  ? const SizedBox.shrink()
                  : IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: CommonTextWidget(
                                  title: context
                                          .watch<CheckinCubit>()
                                          .state
                                          .filesList
                                          .isEmpty
                                      ? 'No files selected'
                                      : 'Selected files: ${context.watch<CheckinCubit>().state.filesList.length}',
                                  textColor: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  textSize: 12.sp)),
                          Expanded(
                              flex: 5,
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<CheckinCubit>()
                                        .clearFilesLists();
                                  },
                                  child: CommonTextWidget(
                                    title: 'Clear All',
                                    textColor: Colors.red,
                                    textSize: 12.sp,
                                    align: TextAlign.end,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      ),
                    ),
              15.verticalSpace,
              context.watch<CheckinCubit>().state.filesList.isEmpty
                  ? const SizedBox.shrink()
                  : 10.verticalSpace,
              context.watch<CheckinCubit>().state.filesList.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 0.25.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 0.25.sh,
                                  width: 0.45.sw,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                    context
                                            .watch<CheckinCubit>()
                                            .state
                                            .filesList[i]
                                            .name.split(".").last.toLowerCase() == "mp4" ? Icons.ondemand_video  :  context
                                            .watch<CheckinCubit>()
                                            .state
                                            .filesList[i]
                                            .name.split(".").last.toLowerCase() == "pdf" ? Icons.picture_as_pdf_sharp  :    Icons.file_copy,
                                        color: Colors.white,
                                        size: 40.sp,
                                      ),
                                      10.verticalSpace,
                                      CommonTextWidget(
                                        title: context
                                            .watch<CheckinCubit>()
                                            .state
                                            .filesList[i]
                                            .name,
                                        textColor: Colors.white,
                                        textSize: 11.sp,
                                        maxLines: 2,
                                      ),
                                    ],
                                  )),
                                ),
                              ).withSymetricPadding(horizontalPadding: 8.w),
                              GestureDetector(
                                onTap: () {
                                  context.read<CheckinCubit>().removeFile(
                                      file: context
                                          .read<CheckinCubit>()
                                          .state
                                          .filesList[i]);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(right: 15.w, top: 10.h),
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 20.sp,
                                  )),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: context
                            .watch<CheckinCubit>()
                            .state
                            .filesList
                            .length,
                      ),
                    ),
            ],
          ).withSymetricPadding(horizontalPadding: 20.w, verticalPadding: 10.h),
        ),
      ),
    );
  }
  
  void pickImages(BuildContext context) 
  {
    HapticFeedback.lightImpact();
    if (context.mounted) {
      showDialog(

        context: context, builder: (c) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        
        // title: CommonTextWidget(title: 'Pick image from ',align: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                context.read<CheckinCubit>().pickFromCameraLogic();
                
              },
              title: const CommonTextWidget(title: 'Camera'),
              leading: const Icon(Icons.camera_alt),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                // context.read<CheckinCubit>().pickSingleImageFromGallery();
                context.read<CheckinCubit>().pickAllImages();
              },
              title: CommonTextWidget(title: 'Gallery'),
              leading: const Icon(Icons.image),
            ),
            Divider(),
              TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Close"),)
          ],
        ),      
      ));
    }
  }
}
