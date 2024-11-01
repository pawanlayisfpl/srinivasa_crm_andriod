import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

class DeliveryTypesResponseModel {
  List<Data>? data;
  bool? status;
  String? message;

  DeliveryTypesResponseModel({this.data, this.status, this.message});

  DeliveryTypesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? deliveryTypeId;
  String? deliveryTypeName;
  String? deliveryTypeCode;

  Data({this.deliveryTypeId, this.deliveryTypeName, this.deliveryTypeCode});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryTypeId = json['deliveryTypeId'];
    deliveryTypeName = json['deliveryTypeName'];
    deliveryTypeCode = json['deliveryTypeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryTypeId'] = deliveryTypeId;
    data['deliveryTypeName'] = deliveryTypeName;
    data['deliveryTypeCode'] = deliveryTypeCode;
    return data;
  }
}


abstract class DeliveryTypesRepo {
   Future<Either<NetworkExceptions,DeliveryTypesResponseModel>> getAllDeliveryTypes();



}


@Injectable(as: DeliveryTypesRepo)
class DeliveryTypesRepoImpl implements DeliveryTypesRepo {
  final KeyValueStorage keyValueStorage;
  final DioClient dioClient;
  final InternetChecker internetChecker;

  DeliveryTypesRepoImpl({required this.keyValueStorage, required this.dioClient, required this.internetChecker});
  @override
  Future<Either<NetworkExceptions, DeliveryTypesResponseModel>> getAllDeliveryTypes() async {
   final status = await internetChecker.hasInternet();


   if(status) {
    final response = await dioClient.get(Endpoints.alertMarkAsRead);

    // ignore: deprecated_member_use
    if(response.statusCode == HttpStatus.OK) {
      return right(DeliveryTypesResponseModel.fromJson(response.data));
    }else {
      return left(NetworkExceptions.defaultError(response.data));
    }


   }else {

    return left(const NetworkExceptions.noInternetConnection());
   }

  }

}




