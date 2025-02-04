import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/Add%20ticket/screen/widget/ticket_description_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/Add%20ticket/screen/widget/ticket_service_request_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/add_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/state/add_ticket_state.dart';

import 'widget/ticket_priority_dropdown_widget.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({super.key});

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Ticket Screen"),
      ),
      body: PopScope(
        onPopInvoked: (c) {
          context.read<AddTicketCubit>().resetState();
        },
        child: SingleChildScrollView(
          child: BlocBuilder<AddTicketCubit, AddTicketState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  const CommonTextFieldHeadingWidget(
                    title: 'Description',
                    isRequired: true,
                  ),
                  const TicketDespTextFieldWidget(),
                  20.verticalSpace,
                  BlocBuilder<AddTicketCubit, AddTicketState>(
                    builder: (context, state) {
                      return  state.isLoading == true ? const Center(child: CircularProgressIndicator(),) : state.imageList.isNotEmpty ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CommonTextFieldHeadingWidget(title: 'Selected Images'),
                              OutlinedButton(onPressed: () {
                                context.read<AddTicketCubit>().clearAllImages();
                              }, child: CommonTextWidget(title: "Clear All",textColor: Colors.red,textSize: 12.sp,))
                            ],
                          ),
                          10.verticalSpace,
                        
                          SizedBox(
                            height: 0.2.sh,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (c,i) {
                              return Column(
                                children: [
                                  Stack(
                                  children: [
                                    SizedBox(height: 0.2.sh,width: 0.35.sw,child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(state.imageList[i].imageByes))),),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () async {
                                            context.read<AddTicketCubit>().removeImageByIndex(i);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            color: Colors.red.shade100,
                                            child: const Icon(Icons.delete,color: Colors.red,)),
                                        )
                                        )
                                  ],
                                                        ),
                                ],
                              );
                            }, separatorBuilder: (c,i) {
                              return 10.horizontalSpace;
                            }, itemCount: state.imageList.length),
                          ),
                        ],
                      ) : context.watch<AddTicketCubit>().state.isLoading == true ? const Center(child: CircularProgressIndicator(),) : DashedBorderContainer(
                        title: 'Upload File',
                        callback: () async {
                          showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text("Information"),
            ],
          ),
          content: const Text(
            "Please press and hold to select multiple images.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                context.read<AddTicketCubit>().pickAllImages(context); // Call the function
              },
              child: const Text(
                "OKAY",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
                        },
                      );
                    },
                  ),
                  20.verticalSpace,
                  const CommonTextFieldHeadingWidget(
                    title: 'Priority',
                    isRequired: true,
                  ),
                  const TicketPriorityDropDownWidget(),
                  20.verticalSpace,
                  const CommonTextFieldHeadingWidget(
                    title: 'Service Request Type',
                    isRequired: true,
                  ),
                  const TicketServiceRequestDropDownWidget(),
                  30.verticalSpace,
                  CommonButton(
                      callback: () => submitbtnFunction(context),
                      title: "Submit"),
                ],
              ).withSymetricPadding(horizontalPadding: 20.w);
            },
          ),
        ),
      ),
    );
  }
}

submitbtnFunction(BuildContext context) async {
  if (context.mounted) {
    context.read<AddTicketCubit>().onSubmit(context);
  }
}

class DashedBorderContainer extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  const DashedBorderContainer(
      {super.key, required this.title, required this.callback});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: CustomPaint(
          painter: DashedBorderPainter(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.file_upload_outlined, color: Colors.black),
                const SizedBox(width: 4), // horizontal space
                CommonTextWidget(
                  title: title,
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(8),
    ));

    // Draw dashed border
    double dashWidth = 5;
    double dashSpace = 3;
    double distance = 0;
    Path dashPath = Path();

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
