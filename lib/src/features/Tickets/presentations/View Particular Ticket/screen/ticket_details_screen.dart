

import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/widgets/text/common_textfield_heading_widget.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/View%20Comment/screen/view_comments_screen.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/screen/gallery_image_screen.dart';

import '../../../../../config/config.dart';
import '../../../data/model/get/ticket_particular_model.dart';

class TicketDetailsScreen extends StatefulWidget {
  final ViewParticularTicketModel ticket;

  const TicketDetailsScreen({super.key, required this.ticket});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
             foregroundColor : AppColors.primaryColor,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                ScaleRoute(
                  screen: ViewCommentsScreen(
                    viewParticularTicketModel: context.read<ViewParticularTicketCubit>().state.mapOrNull(
                      loaded: (data) => data.viewParticularTicketModel,
                    ),
                    
                  ),
                ),
              );
            }, label: CommonTextWidget(title: 'View Comments',fontWeight: FontWeight.w500,textSize: 14.sp,), icon:  Icon(Icons.add_comment,size: 18.sp,color: AppColors.primaryColor,))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      _buildDetailRow('Ticket ID', widget.ticket.ticketId.toString()),
      _buildDetailRow('Description', widget.ticket.description ?? "N/A"),
      _buildDetailRow('Created Date', DateFormat.yMMMEd().format(DateTime.parse(DateTime.now().toString()))),
      _buildDetailRow('Priority', widget.ticket.priority?.priorityName),
      _buildDetailRow('Status', widget.ticket.statusDTO?.statusName),
      _buildDetailRow('Service Request Type', widget.ticket.serviceRequestTypeDTO?.serviceRequestTypeName),
      _buildDetailRow('Created By', widget.ticket.createdBy?.userName),
      _buildDetailRow('Assigned To', widget.ticket.assignedTo?.assignedToUserName),
      SizedBox(height: 20.h),
      if(widget.ticket.images != null)
      const CommonTextFieldHeadingWidget(title: 'Attachments:-'),
      const SizedBox(height: 10,),
      GridView.builder(
        
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: (0.22.sw / (0.2.sh)), // 20% height
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ()  {
              if(context.mounted) {
                // ImageGalleryPage
                // Navigator.push(context, ScaleRoute(screen: ImageGalleryPage(imageUrls: widget.ticket.images!)));
                Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ImageGalleryPage(
      imageUrls: widget.ticket.images!.map((e) => e.toString()).toList(),
      initialIndex: index, // Pass the initially selected index
    ),
  ),
);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 0.2.sh, // 20% of screen height
                width: 0.45.sw, // 45% of screen width
                child: TokenImage(imageUrl: widget.ticket.images![index].toString()),
              ),
            ),
          );
        },
        itemCount: widget.ticket.images != null ?  widget.ticket.images!.length : 0,
      ),
    ],
  ),
          )
        ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? 'N/A'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildComments(List<Comments>? comments) {
    if (comments == null || comments.isEmpty) {
      return [const Text('No comments available')];
    }
    return comments.map((comment) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.user?.userName ?? 'Unknown User',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(comment.commentText ?? ''),
              const SizedBox(height: 8),
              Text(
                comment.created ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}



Future<Uint8List> fetchImageWithToken(String url,) async {
  String? token =  locator.get<KeyValueStorage>().getString(KeyValueStrings.token);
  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}

class TokenImage extends StatelessWidget {
  final String imageUrl;


  const TokenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: fetchImageWithToken(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Icon(Icons.error);
        } else {
          return Image.memory(snapshot.data!);
        }
      },
    );
  }
}
