// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/core/storage/key_value_storage.dart';
import 'package:srinivasa_crm_new/src/features/Comments/domain/model/post/comment_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/Add%20Comment/cubit/add_comment_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/View%20Comment/cubit/view_comment_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Comments/presentations/View%20Comment/cubit/view_comment_state.dart';

import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_particular_model.dart';

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
    super.key,
    required this.viewParticularTicketModel,
  });

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
      String? id = locator
          .get<KeyValueStorage>()
          .sharedPreferences
          .getString(KeyValueStrings.userId);
      userId = id ?? "1";

      await context.read<ViewCommentsCubit>().getAllCommentsByTicketId(
          widget.viewParticularTicketModel!.ticketId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Comments Screen"),
        actions: [
       context.watch<ViewCommentsCubit>().state.isLoading == true ? const SizedBox.shrink() :   IconButton(onPressed: () async {
            await context.read<ViewCommentsCubit>().getAllCommentsByTicketId(widget.viewParticularTicketModel!.ticketId.toString());
          }, icon: const Icon(Icons.refresh),color: Colors.white,)
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ViewCommentsCubit, ViewCommentState>(
          builder: (context, state) {
            return Column(
              children: [
              context.watch<AddCommentCubit>().state.isSubmitting  ? const Expanded(child: CustomLoadingWidget()) :   state.isLoading ? const Expanded(child: CustomLoadingWidget()) :  Expanded(
                  child: state.commentsList.isEmpty ? const Center(child: Text("No comments found"),) : ListView.builder(
                    itemCount:
                        state.commentsList.length,
                    itemBuilder: (context, index) {
                      final commentModel = state.commentsList[index];                        
                      final isAdmin =
                          commentModel.user?.userId.toString() != userId.toString();
                      return Align(
                        alignment: isAdmin
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isAdmin ? Colors.blue : Colors.grey[300],
                            borderRadius: isAdmin ?  const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ) :  const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentModel.user!.userName ?? 'Unknown',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isAdmin ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                commentModel.commentText ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color:
                                      isAdmin ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                DateFormat.yMEd().add_jm().format(
                                    DateTime.parse(commentModel.created ??
                                        DateTime.now().toString())),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isAdmin
                                      ? Colors.white70
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
         keyboardType: TextInputType.multiline,
  maxLines: null, // Allows unlimited lines
  minLines: 1, 
                          decoration: InputDecoration(

                            hintText: 'Add a comment...',
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.primaryColor),
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
                          onPressed: () async {
                            if(_commentController.text.isNotEmpty) {
                              CommentPostModel commentPostModel = CommentPostModel(
                              id: widget.viewParticularTicketModel!.ticketId.toString(),
                              commentText: _commentController.text,
                            );
                            await context.read<AddCommentCubit>().addComment(commentPostModel,() {
                              _commentController.clear();
                              Fluttertoast.showToast(msg: "Comment added successfully");
                              context.read<ViewCommentsCubit>().getAllCommentsByTicketId(widget.viewParticularTicketModel!.ticketId.toString());
                            },);
                            }else {
                              Fluttertoast.showToast(msg: "Please enter comment");
                            }
                            // Add your send comment logic here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
