import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_cubit.dart';
import '../../../common/common.dart';
import 'travel_data_widget.dart';

class TravelDataScreen extends StatefulWidget {
  const TravelDataScreen({super.key});

  @override
  State<TravelDataScreen> createState() => _TravelDataScreenState();
}

class _TravelDataScreenState extends State<TravelDataScreen> {
  DateTimeRange? selectedRange;
  String startedDateShow = "";
  String endDateShow = "";

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedRange = DateTimeRange(
      start: now.subtract(const Duration(days: 30)),
      end: now,
    );

    // Call API initially with default 30-day range
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final startDate = DateFormat('yyyy-MM-dd').format(selectedRange!.start);
      final endDate = DateFormat('yyyy-MM-dd').format(selectedRange!.end);
      startedDateShow =startDate;
      endDateShow = endDate;
      await context.read<TravelDataCubit>().getTravelDataApi(startDate, endDate);
    });
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 30)), // Up to 1 year back
      lastDate: DateTime.now(),
      initialDateRange: selectedRange ??
          DateTimeRange(
            start: DateTime.now().subtract(const Duration(days: 30)),
            end: DateTime.now(),
          ),
    );

    if (picked != null && picked != selectedRange) {
      setState(() {
        selectedRange = picked;
      });

      final startDate = DateFormat('yyyy-MM-dd').format(picked.start);
      final endDate = DateFormat('yyyy-MM-dd').format(picked.end);
startedDateShow =startDate;
endDateShow = endDate;
      await context.read<TravelDataCubit>().getTravelDataApi(startDate, endDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('Travel Data'),
           const SizedBox(height: 5),
            Row(
              children: [
               const SizedBox(width: 25,),
                Text("$startedDateShow - ",style:const TextStyle(color: Colors.white,fontSize: 15)),
                Text(endDateShow,style:const TextStyle(color: Colors.white,fontSize: 15),)
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _selectDateRange,
          ),
        ],
      ),
      body: SafeArea(
        child: Visibility(
          visible: !context.watch<TravelDataCubit>().state.isLoading,
          replacement: const CustomLoadingWidget(),
          child: const TravelDataWidget(),
        ),
      ),
    );
  }
}
