import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Travel_Data/cubits/travel_data_state.dart';

import 'view_travel_loaded_widget.dart';


class TravelDataWidget extends StatelessWidget {
  const TravelDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelDataCubit, TravelDataState>(
      builder: (context, state) {
        return TravelDataLoadedWidget(travelDataList: state.travelDataModel!.data);
      },
    );
  }
}
