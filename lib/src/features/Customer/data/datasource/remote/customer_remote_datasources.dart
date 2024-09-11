import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/approved_customer_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_code_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_full_details_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkin_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkout_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/customer_create_post_model.dart';

import '../../../../../core/model/model.dart';
import '../../../domain/model/get/checkIn_response_model.dart';
import '../../../domain/model/get/checkout_response_model.dart';
import '../../../domain/model/get/customer_created_response_model.dart';
import '../../../domain/model/get/customer_model.dart'; 
import '../../../domain/model/get/customer_response_model.dart';
import '../../../domain/model/get/last_checkin_out_respone_model.dart';

abstract class CustomerRemoteDataSource{
  Future<CustomerResponseModel> getCustomers();
  Future<CustomerResponseModel> getAllCustomerDemo();
  Future<Customermodel> getCustomerById(int id);
  Future<CheckInResponseModel> checkIn({required CheckinPostModel checkinPostModel});
  Future<CheckoutResponseModel> checkOut({required CheckoutPostModel checkoutPostModel});
  Future<LastCheckinOutResponseModel> getLastCheckInCheckoutDetails({required String customerId,required String farmId});
  Future<List<Customermodel>> searchCustomer({required String searchKey});
  Future<CustomerFullDetailsModel> getCustomerFullDetails({required String customerCode});
  Future<List<AssignedToModel>> getAssignedLists({required ZoneModel zoneModel});
  Future<CustomerCreatedResponseModel> createCustomer({required CustomerCreatePostModel customerCreatePostModel});
  Future<List<CustomerCodeModel>> getApprovedCustomerList();
  Future<List<JoinEmployeModel>> getJointEmployeList();
  
}


@Injectable(as : CustomerRemoteDataSource)
class CustomerRemoteDatasourcesImpl implements CustomerRemoteDataSource {
 final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final Logger logger;
  final InternetChecker connectionChecker;

  CustomerRemoteDatasourcesImpl(this.dioClient, this.keyValueStorage, this.logger, this.connectionChecker);
  
  @override
  Future<CheckInResponseModel> checkIn({required CheckinPostModel checkinPostModel}) async {
    final result = await connectionChecker.isConnected();

    if(result) {
      try {
        final response = await dioClient.post(Endpoints.checkInPostUrl,data: checkinPostModel.toJson(),headers: {});

        if(response.statusCode == 200)  {
          CheckInResponseModel checkInResponseModel =  CheckInResponseModel.fromJson(response.data);

          await keyValueStorage.sharedPreferences.setString(KeyValueStrings.checkinTime,checkInResponseModel.time.toString());
          return await Future.value(checkInResponseModel);
        
        }else {
          throw  NetworkExceptions.getException(response.data);
        }
        
      } catch (e) {
        if(e is DioException) {
          logger.e(e.response!.data.toString());
          throw NetworkExceptions.getException(e);
        }else {
          throw const NetworkExceptions.internalServerError();
        }
        
      }
    }else {
      throw const NetworkExceptions.noInternetConnection();
    
    }
    }
  
  @override
  Future<CheckoutResponseModel> checkOut({required CheckoutPostModel checkoutPostModel}) async {
   final result = await connectionChecker.isConnected();

   if(result) {
    try {
     List<MultipartFile> files = [];
    if (checkoutPostModel.files != null) {
      for (var file in checkoutPostModel.files!) {
        files.add(MultipartFile.fromBytes(file, filename: 'file'));
      }
    }
    
      List<MultipartFile> imagesList = [];
    if (checkoutPostModel.images != null) {
      for (var file in checkoutPostModel.images!) {
        files.add(MultipartFile.fromBytes(file, filename: 'images'));
      }
    }

    FormData data = FormData.fromMap({
      'userIds': checkoutPostModel.userIds,
      'outTime': DateTime.now().toString(),
      'customerId': checkoutPostModel.customerId,
      'farmId': checkoutPostModel.farmId,
      'customerName': checkoutPostModel.customerName,
      'langitude': checkoutPostModel.langitude,
      'latitude': checkoutPostModel.latitude,
      'remarks': checkoutPostModel.remarks,
      'puposeId': checkoutPostModel.purposeId,
      'images': imagesList,
      'pdfs': files,
    });

      final response = await dioClient.post(Endpoints.checkOut,data: data,headers: {});

      if (response.statusCode == 200) {
        return CheckoutResponseModel.fromJson(response.data);
      } else {
        throw NetworkExceptions.getException(response.data);
      }
    } on DioException catch (e) {
      throw  NetworkExceptions.getException(e);
    }

   }else {
    throw const NetworkExceptions.noInternetConnection();
   
   }
  }
  
  @override
  Future<CustomerResponseModel> getAllCustomerDemo()  async{
   final result = await connectionChecker.isConnected();

   if(result) {
    try {
      final response = await dioClient.get(Endpoints.getAllCustomerDemo);

      if(response.statusCode == 200) {
        return CustomerResponseModel.fromJson(response.data);
      }else {
        throw NetworkExceptions.getException(response.data);
      }
    } on DioException catch (e) {
      logger.e(e);
      throw NetworkExceptions.getException(e);
    }on FormatException catch (e) {
      logger.e(e);
      throw const NetworkExceptions.formatException();
    }

   }else {
    throw const NetworkExceptions.noInternetConnection();
   }

  }
  
  @override
  Future<Customermodel> getCustomerById(int id)  async{
    final result = await connectionChecker.isConnected();
    if(result) {
      try {
        final response = await dioClient.get(
          Endpoints.customerFullDeails,
          
         headers: {},
        );
        return Customermodel.fromJson(response.data);
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getException(e);
      }
    }else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
  @override
Future<CustomerFullDetailsModel> getCustomerFullDetails({required String customerCode}) async {
  final isConnected = await connectionChecker.isConnected();
  if (!isConnected) {
    throw const NetworkExceptions.noInternetConnection();
  }

  try {
    final response = await dioClient.post(
      Endpoints.customerFullDeails,
      data: {"custCode": customerCode},
      headers: {},
    );

    if (response.statusCode == 200) {
      return CustomerFullDetailsModel.fromJson(response.data["customers"][0]);
    } else {
      throw NetworkExceptions.getException(response.data);
    }
  } on DioException catch (e) {
    throw NetworkExceptions.getException(e);
  } on FormatException {
    throw const NetworkExceptions.formatException();
  }
}
  @override
  Future<CustomerResponseModel> getCustomers() async {
     try {
         final response = await dioClient.get(
          Endpoints.getAllCustomers,
          headers: {},

        );
        if(response.statusCode == 200) {
          return CustomerResponseModel.fromJson(response.data);
        }else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getDioException(e);
      }
  //   final results = await connectionChecker.isConnected();
  //   if(results)  {
      
  //     try {
  //       final response = await dioClient.get(
  //         Endpoints.getAllCustomers,
  //         headers: {},

  //       );
  //       if(response.statusCode == 200) {
  //         return CustomerResponseModel.fromJson(response.data);
  //       }else {
  //         throw NetworkExceptions.getDioException(response.data);
  //       }
  //     } on DioException catch (e) {
  //       logger.e(e);
  //       throw NetworkExceptions.getDioException(e);
  //     }
  //   }else {
  //     String? data =  keyValueStorage.sharedPreferences.getString(KeyValueStrings.customersData);
  //     if(data != null) {
  //       return CustomerResponseModel.fromJson(jsonDecode(data));
  //     }else {
  //       throw const NetworkExceptions.noInternetConnection();


      
  //   }
  // }
  }
  
  @override
  Future<LastCheckinOutResponseModel> getLastCheckInCheckoutDetails({required String customerId,required String farmId}) async {

    try {
        final response = await dioClient.post(
          Endpoints.lastCheckInCheckOut,
          headers: {},
          data:{
    "customerId": customerId,
    "farmId":farmId
},
        );

        if(response.statusCode == 200) {
          return  LastCheckinOutResponseModel.fromJson(response.data);
        }else {
          throw NetworkExceptions.getException(response.data);
        }
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getException(e);
      }
  //  final result = await connectionChecker.isConnected();
  //   if(result) {
  //     try {
  //       final response = await dioClient.post(
  //         Endpoints.lastCheckInCheckOut,
  //         headers: {},
  //         data: {
  //           'custCode': customerId,
            
  //         },
  //       );

  //       if(response.statusCode == 200) {
  //         return  await Future.value(LastCheckinOutResponseModel.fromJson(response.data));
  //       }else {
  //         throw NetworkExceptions.getException(response.data);
  //       }
  //     } on DioException catch (e) {
  //       logger.e(e);
  //       throw NetworkExceptions.getException(e);
  //     }


  // }else {
  //   throw const NetworkExceptions.noInternetConnection();
  
  // }
  }
  
  @override
  Future<List<Customermodel>> searchCustomer({required String   searchKey}) async {
    try {
      final response = await dioClient.post(
        Endpoints.searchCustomer,
        data: {
                  "custName" : searchKey

        },
        
        
        headers: {},

      );
       List<Customermodel> customerList = [];
      final List data = response.data['customers'];
      customerList = data.map((e) => Customermodel.fromJson(e)).toList();
      return customerList;
    } on DioException catch (e) {
      logger.e(e);
      throw NetworkExceptions.getDioException(e);
    }
  //  final results = await connectionChecker.isConnected();
  //  if(results) {
  //   try {
  //     final response = await dioClient.post(
  //       Endpoints.searchCustomer,
  //       data: {
  //                 "custName" : searchKey

  //       },
        
        
  //       headers: {},

  //     );
  //      List<Customermodel> customerList = [];
  //     final List data = response.data['customers'];
  //     customerList = data.map((e) => Customermodel.fromJson(e)).toList();
  //     return customerList;
  //   } on DioException catch (e) {
  //     logger.e(e);
  //     throw NetworkExceptions.getDioException(e);
  //   }

  //  }else {
  //   throw  const NetworkExceptions.noInternetConnection();
  //  }
  }
  
  @override
  Future<List<AssignedToModel>> getAssignedLists({required ZoneModel zoneModel}) async {
   try {
    final response = await dioClient.post(
    Endpoints.assignedToUrl,
   headers: {},
    
    
    data: {
      "zoneId": zoneModel.zoneId.toString(),
    },
  );
    if(response.statusCode == 200) {
      final List data = response.data['body'];
      final List<AssignedToModel> assignedToList = data.isEmpty ? [] :  data.map((e) => AssignedToModel.fromJson(e)).toList();
      return assignedToList;
    }else {
      throw NetworkExceptions.getDioException(response.data);

    }
     
   } on DioException catch (e) {
    throw NetworkExceptions.getDioException(e);
     
   }
  }
  
  @override
  Future<CustomerCreatedResponseModel> createCustomer({required CustomerCreatePostModel customerCreatePostModel}) async {
    final result = await connectionChecker.isConnected();
    if(result) {
      debugPrint(customerCreatePostModel.toJson().toString());
      try {
        final response = await dioClient.post(
          Endpoints.createCustomer,
          data: customerCreatePostModel.toJson(),
          headers: {},
        );

        if(response.statusCode == 201) {
          return CustomerCreatedResponseModel.fromJson(response.data);
        }else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getDioException(e);
      }
    }else {
      throw const  NetworkExceptions.noInternetConnection();
    }
  }
  
  @override
  Future<List<CustomerCodeModel>> getApprovedCustomerList() async {
    
    try {
      final results = await dioClient.get(Endpoints.approvedCustomerUrl,headers: {});

      if(results.statusCode == 200) {
          final List data = results.data['customers'];

      final List<CustomerCodeModel> approvedCustomerList = data.map((e) => CustomerCodeModel.fromJson(e)).toList();
      return approvedCustomerList;
      }else {
        throw NetworkExceptions.getDioException(results.data);


      }
    
      
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<List<JoinEmployeModel>> getJointEmployeList() async {
    try {
      final response = await dioClient.get(Endpoints.jointemployesUrl,headers: {});

      if(response.statusCode == 200) {
        final List data = response.data['data'];
        final List<JoinEmployeModel> employeeList = data.map((e) => JoinEmployeModel.fromJson(e)).toList();
        return employeeList;
      }else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}