// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/model/traveldatamodel.dart';
 

class TravelDataLoadedWidget extends StatelessWidget {
  final Data? travelDataList;

  const TravelDataLoadedWidget({
    super.key,
    required this.travelDataList,
  });

  @override
  Widget build(BuildContext context) {
    if (travelDataList!.customDailyReportDtoList.isEmpty) {
      return EmptyWidget(title: "Traval Data Not Found", isRetrySHow: false, callback: () async {
      // await context.read<TravelDataCubit>().getTravelDataApi();
      });
    }

    return ListView.builder(
      itemCount: travelDataList!.customDailyReportDtoList.length,
      itemBuilder: (context, index) {
        return  Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 4.0,
              child: ListTile(
                leading: const Icon(Icons.social_distance, color: Colors.blue),
                title: Row(
                  children: [
                   const Text(
                      "Mode of Transport",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      travelDataList!.customDailyReportDtoList[index].modeOfTransport,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Text('ID : ${ticket.city}'),
                   // Text('Created Date: ${DateFormat.yMMMd().format(DateTime.parse(ticket.createdDate.toString()))}'),
                   // Text('Priority: ${ticket.priority?.priorityName ?? 'N/A'}'),
                   // Text('Status: ${ticket.statusDTO?.statusName ?? 'N/A'}'),
                   // Text('Service Request Type: ${ticket.serviceRequestTypeDTO?.serviceRequestTypeName ?? 'N/A'}'),
                  ],
                ),
         
              ),
            );
      
      },
    );
  }
}
