import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/kyc_upload_cubit.dart';
class PancardImageWidget extends StatelessWidget {
  const PancardImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _loadImage(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading image'));
        } else {
          return Image.memory(snapshot.data!, fit: BoxFit.cover);
        }
      },
    );
  }
  Future<Uint8List> _loadImage(BuildContext context) async {
    // Simulate a delay for loading the image
    await Future.delayed(const Duration(milliseconds: 800));
    return context.read<KycUploadCubit>().state.gstFile!.imageByes;
  }
}