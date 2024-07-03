import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

  class SearchCustomerLoadingWidget extends StatelessWidget {
    const SearchCustomerLoadingWidget({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Expanded(
        child: ListView.separated(itemBuilder: (c,i) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade100,
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                  height: 20,
                  width: 0.8.sw,
                  child: Container(color: Colors.grey,),
                                
                                ),
                ),
              10.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Container(color: Colors.grey,),
                
                ),
              )
              ],),
              ),
          );
        },itemCount: 20, separatorBuilder: (BuildContext context, int index) { 
          return Shimmer.fromColors(baseColor: Colors.grey,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            width: 0.8.sw,
            child: const Divider()));
         },),
      );
    }
  }