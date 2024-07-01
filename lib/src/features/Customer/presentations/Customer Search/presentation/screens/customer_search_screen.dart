import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/config.dart';
import '../cubit/search_customer_cubit.dart';
import 'widgets/search_customer_body_widget.dart';


class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
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
                          controller: context.watch<SearchCustomerCubit>().searchController,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) _debounce!.cancel();
                            _debounce = Timer(const Duration(milliseconds: 200), () {
                              context.read<SearchCustomerCubit>().searchCustomer(value);
                             
                              
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Customer',
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.search, color: Colors.black),
                            suffixIcon: context.watch<SearchCustomerCubit>().searchController.text.isNotEmpty ? GestureDetector(
                              onTap: () {
                                // context.read<SearchCustomerCubit>().searchController.clear();
                                context.read<SearchCustomerCubit>().clearController();
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
     
      body: const SafeArea(child: CustomerSearchBodyWidget()),
    );
  }
}