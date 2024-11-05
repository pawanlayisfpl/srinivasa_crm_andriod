// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart';

import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_particular_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/View%20Particular%20Ticket/cubit/view_particular_ticket_cubit.dart';

import '../../../../../config/config.dart';

// class ViewCommentsScreen extends StatefulWidget {
//   final ViewParticularTicketModel viewParticularTicketModel;
//   const ViewCommentsScreen({
//     super.key,
//     required this.viewParticularTicketModel,
//   });

//   @override
//   State<ViewCommentsScreen> createState() => _ViewCommentsScreenState();
// }

// class _ViewCommentsScreenState extends State<ViewCommentsScreen> {
//   String adminId = "121213";
//   final TextEditingController _commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("View Comments Screen"),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.viewParticularTicketModel.comments?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final comment = widget.viewParticularTicketModel.comments![index];
//                   final isAdmin = comment.user?.userId.toString() == adminId;
//                   return Align(
//                     alignment: isAdmin ? Alignment.centerRight : Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: isAdmin ? Colors.blue : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             comment.user?.userName ?? 'Unknown',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: isAdmin ? Colors.white : Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             comment.commentText ?? '',
//                             style: TextStyle(
//                               color: isAdmin ? Colors.white : Colors.black,
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             comment.created ?? '',
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: isAdmin ? Colors.white70 : Colors.black54,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _commentController,
//                       decoration: InputDecoration(
//                         hintText: 'Add a comment...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   CircleAvatar(
//                     child: IconButton(
//                       icon: const Icon(Icons.send),
//                       onPressed: () {
//                         // Add your send comment logic here
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ViewCommentsScreen extends StatefulWidget {
  final ViewParticularTicketModel? viewParticularTicketModel;
  const ViewCommentsScreen({
    Key? key,
    required this.viewParticularTicketModel,
  }) : super(key: key);

  @override
  State<ViewCommentsScreen> createState() => _ViewCommentsScreenState();
}

class _ViewCommentsScreenState extends State<ViewCommentsScreen> {
  String adminId = "121213";
  String userId = "";
  final TextEditingController _commentController = TextEditingController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      String? id =  locator.get<KeyValueStorage>().sharedPreferences.getString(KeyValueStrings.userId);
      userId = id ?? "1";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Comments Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Visibility(
                visible: widget.viewParticularTicketModel?.comments?.isNotEmpty ?? false,
                replacement: const Center(
                  child: Text('No comments found'),
                ),
                child: ListView.builder(
                  itemCount: widget.viewParticularTicketModel!.comments?.length ?? 0,
                  itemBuilder: (context, index) {
                    final comment = widget.viewParticularTicketModel!.comments![index];
                    final isAdmin = comment.user?.userId.toString() != userId;
                    return Align(
                      alignment: isAdmin ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isAdmin ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comment.user?.userName ?? 'Unknown',
                               maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                                              overflow: TextOverflow.ellipsis,

                                
                                fontWeight: FontWeight.bold,
                                color: isAdmin ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              comment.commentText ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                                              overflow: TextOverflow.ellipsis,

                                color: isAdmin ? Colors.white : Colors.black,
                                
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                                DateFormat.yMEd().add_jm().format(DateTime.parse(comment.created ?? DateTime.now().toString())),
                              style: TextStyle(
                                fontSize: 10,
                                color: isAdmin ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ) ,
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        // Add your send comment logic here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}