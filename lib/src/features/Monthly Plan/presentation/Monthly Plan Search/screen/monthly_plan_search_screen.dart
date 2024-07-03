import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/cubit/monthly_plan_search_cubit.dart';

import '../../../../../config/config.dart';



class MonthlyPlanSearchScreen extends StatefulWidget {
  const MonthlyPlanSearchScreen({super.key});

  @override
  State<MonthlyPlanSearchScreen> createState() => _MonthlyPlanSearchScreenState();
}

class _MonthlyPlanSearchScreenState extends State<MonthlyPlanSearchScreen> {
    Timer? _debounce;

    @override
    void dispose() {
      _debounce?.cancel();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false  ,
        title: Container(
              color: AppColors.primaryColor,
              height: 0.08.sh,
              width: double.infinity,
              child: Row(children: [
                // back icon
                 Expanded(child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_rounded,color: Colors.white,))),

                // search field
                Expanded(
                  flex: 8,
                  child: FractionallySizedBox(
                    widthFactor: 0.95,
                    heightFactor: 0.75,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: TextFormField(
                          cursorColor: AppColors.primaryColor,
                          controller: context.watch<MonthlyPlanSearchCubit>().searchController,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) _debounce!.cancel();
                            _debounce = Timer(const Duration(milliseconds: 200), () {
                              context.read<MonthlyPlanSearchCubit>().searchEmploye(searchKey: value);
                             
                              
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search by employee name',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.search, color: Colors.black),
                            suffixIcon: context.watch<MonthlyPlanSearchCubit>().searchController.text.isNotEmpty ? GestureDetector(
                              onTap: () {
                                // context.read<SearchCustomerCubit>().searchController.clear();
                                context.read<MonthlyPlanSearchCubit>().clearController();
                              },
                              child: const Icon(Icons.clear, color: Colors.black),
                            ) : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                    ),
                  )),
              ],),
            ),
      ),
     
      body:  SafeArea(child: Container()),
    );
  }
}