import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DropdownLoadingWidget extends StatelessWidget {
  const DropdownLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: const [],
      onChanged: (String? value) {},
      value: null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select an option',
        hintStyle: TextStyle(color: Colors.grey),
      ),
      hint: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: const Text(
          'Loading...',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}