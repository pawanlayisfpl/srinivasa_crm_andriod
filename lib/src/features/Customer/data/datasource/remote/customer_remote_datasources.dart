import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/database/checkin_database.dart';
import 'package:srinivasa_crm_new/src/features/Customer/database/checkout_database.dart';
import 'package:srinivasa_crm_new/src/features/Customer/database/joint_employe_database.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_code_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_full_details_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkin_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkout_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/customer_create_post_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/model/model.dart';
import '../../../database/customer_database.dart';
import '../../../domain/model/get/checkIn_response_model.dart';
import '../../../domain/model/get/checkout_response_model.dart';
import '../../../domain/model/get/customer_created_response_model.dart';
import '../../../domain/model/get/customer_model.dart'; 
import '../../../domain/model/get/customer_response_model.dart';
import '../../../domain/model/get/last_checkin_out_respone_model.dart';

abstract class CustomerRemoteDataSource {
  Future<CustomerResponseModel> getCustomers();
  Future<CustomerResponseModel> getAllCustomerDemo();
  Future<Customermodel> getCustomerById(int id);
  Future<CheckInResponseModel> checkIn(
      {required CheckinPostModel checkinPostModel});
  Future<CheckoutResponseModel> checkOut(
      {required CheckoutPostModel checkoutPostModel});
  Future<LastCheckinOutResponseModel> getLastCheckInCheckoutDetails(
      {required String customerId, required String farmId});
  Future<List<Customermodel>> searchCustomer({required String searchKey});
  Future<CustomerFullDetailsModel> getCustomerFullDetails(
      {required String customerCode});
  Future<List<AssignedToModel>> getAssignedLists(
      {required ZoneModel zoneModel});
  Future<CustomerCreatedResponseModel> createCustomer(
      {required CustomerCreatePostModel customerCreatePostModel});
  Future<List<CustomerCodeModel>> getApprovedCustomerList();
  Future<List<JoinEmployeModel>> getJointEmployeList();
}

@Injectable(as: CustomerRemoteDataSource)
class CustomerRemoteDatasourcesImpl implements CustomerRemoteDataSource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final Logger logger;
  final InternetChecker connectionChecker;

  CustomerRemoteDatasourcesImpl(this.dioClient, this.keyValueStorage,
      this.logger, this.connectionChecker);
  @override
  Future<CheckInResponseModel> checkIn(
      {required CheckinPostModel checkinPostModel}) async {
    logger.d('CHECKIN API STARTED');
    logger.d('CHECKING INTERNET');

    final result = await connectionChecker.hasInternet();
    final database = CheckinPostDatabase();
    // await database.deleteAllCheckinPosts();

    if (result) {
      // INTERNET AVAILABLE
      try {
        logger.d('INTERNET AVAILABLE, MAKING API CALL');
        final response = await dioClient.post(Endpoints.checkInPostUrl,
            data: checkinPostModel.toJson(), headers: {});

        if (response.statusCode == 200) {
          await database.insertCheckinPost(checkinPostModel);
          // await database.deleteAllCheckinPosts();
         
    
          logger.d('API CALL SUCCESSFUL, PROCESSING RESPONSE');
          CheckInResponseModel checkInResponseModel =
              CheckInResponseModel.fromJson(response.data);

          logger.d('SAVING CHECKIN TIME TO SHARED PREFERENCES');
          await keyValueStorage.sharedPreferences.setString(
              KeyValueStrings.checkinTime,
              checkInResponseModel.time.toString());
          logger.d('CHECKIN TIME SAVED SUCCESSFULLY');
          return await Future.value(checkInResponseModel);
        } else {
          logger.e('API CALL FAILED WITH STATUS CODE: ${response.statusCode}');
          throw NetworkExceptions.getException(response.data);
        }
      } catch (e) {
        if (e is DioException) {
          logger.e('DIO EXCEPTION OCCURRED: ${e.response!.data.toString()}');
          throw NetworkExceptions.getException(e);
        } else {
          logger.e('INTERNAL SERVER ERROR OCCURRED');
          throw const NetworkExceptions.internalServerError();
        }
      }
    } else {
      // NO INTERNET

      logger.d('NO INTERNET, SAVING CHECKIN LOCALLY');
      int id = await database.insertCheckinPost(checkinPostModel);

      if (id != 0) {
        logger.d('CHECKIN SAVED LOCALLY WITH ID: $id');
        return CheckInResponseModel(
          status: true,
          time: DateTime.now().toString(),
          message: 'Checkin Successful',
        );
      } else {
        logger.e('FAILED TO SAVE CHECKIN LOCALLY');
        throw const NetworkExceptions.noInternetConnection();
      }
    }
  }

  @override
  Future<CheckoutResponseModel> checkOut(
      {required CheckoutPostModel checkoutPostModel}) async {
    final result = await connectionChecker.isConnected();
    final databse =  CheckoutPostDatabase();
    // await databse.deleteAllCheckoutPost();

    if (result) {
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

        final response =
            await dioClient.post(Endpoints.checkOut, data: data, headers: {});

        if (response.statusCode == 200) {
          await databse.insertCheckoutPost(checkoutPostModel);
          return CheckoutResponseModel.fromJson(response.data);
        } else {
          throw NetworkExceptions.getException(response.data);
        }
      } on DioException catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
          await databse.insertCheckoutPost(checkoutPostModel);
          return CheckoutResponseModel(
            status: true,
            message: 'Checkout Successful',
          );
      // throw const NetworkExceptions.noInternetConnection();
    }
  }

  @override
  Future<CustomerResponseModel> getAllCustomerDemo() async {
    final result = await connectionChecker.isConnected();

    if (result) {
      try {
        final response = await dioClient.get(Endpoints.getAllCustomerDemo);

        if (response.statusCode == 200) {
          return CustomerResponseModel.fromJson(response.data);
        } else {
          throw NetworkExceptions.getException(response.data);
        }
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getException(e);
      } on FormatException catch (e) {
        logger.e(e);
        throw const NetworkExceptions.formatException();
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  @override
  Future<Customermodel> getCustomerById(int id) async {
    final result = await connectionChecker.isConnected();
    if (result) {
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
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  @override
  Future<CustomerFullDetailsModel> getCustomerFullDetails(
      {required String customerCode}) async {
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
    logger.d('GET ALL CUSTOMERS API STARTED');
    logger.d('CHECKING INTERNET');
    final results = await connectionChecker.hasInternet();
    final database = CustomerDataBaseHelper();
// TODO: REMOVE ! FROM RESULTS
    if (results) {
      // Corrected the condition to check for internet availability
      try {
        logger.d('INTERNET AVAILABLE, MAKING API CALL');
        final response = await dioClient.get(
          Endpoints.getAllCustomers,
          headers: {},
        );

        if (response.statusCode == 200) {
          await database.deleteAllCustomerResponses();
          logger.d('API CALL SUCCESSFUL, PROCESSING RESPONSE');
          CustomerResponseModel customerResponseModel =
              CustomerResponseModel.fromJson(response.data);

          logger.d('INSERTING DATA INTO LOCAL DATABASE');
          await database.insertCustomerResponse(customerResponseModel);
          logger.d('DATA INSERTED INTO LOCAL DATABASE SUCCESSFULLY');

          return customerResponseModel;
        } else {
          logger.e('API CALL FAILED WITH STATUS CODE: ${response.statusCode}');
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        logger.e('DIO EXCEPTION OCCURRED: ${e.response?.data.toString()}');
        throw NetworkExceptions.getDioException(e);
      }
    } else {
      logger.d('NO INTERNET, LOADING DATA FROM OFFLINE DATABASE');
      List<CustomerResponseModel> customerList =
          await database.getCustomerResponses();

      if (customerList.isNotEmpty) {
        logger.d('OFFLINE DATA LOADED SUCCESSFULLY');
        return customerList.first;
      } else {
        logger.d('NO OFFLINE DATA AVAILABLE');
        return CustomerResponseModel(customermodel: []);
      }
    }
  }
  
@override
Future<LastCheckinOutResponseModel> getLastCheckInCheckoutDetails(
    {required String customerId, required String farmId}) async {
  final results = await connectionChecker.hasInternet();
  final checkinDatabase = CheckinPostDatabase();
  final checkoutDatabase = CheckoutPostDatabase();

  logger.d('Checking internet connection...');
  if (results) {
    // INTERNET AVAILABLE
    logger.d('Internet available, fetching data from server...');
    try {
      final response = await dioClient.post(
        Endpoints.lastCheckInCheckOut,
        headers: {},
        data: {"customerId": customerId, "farmId": farmId},
      );

      logger.d('Server response received with status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        logger.d('Data fetched successfully from server.');
        return LastCheckinOutResponseModel.fromJson(response.data);
      } else {
        logger.d('Error fetching data from server: ${response.data}');
        throw NetworkExceptions.getException(response.data);
      }
    } on DioException catch (e) {
      logger.e('DioException occurred: $e');
      throw NetworkExceptions.getException(e);
    }
  } else {
      // NO INTERNET
    logger.d('No internet connection, loading data from offline database...');
    List<CheckinPostModel> checkinList = await checkinDatabase.getCheckinPosts();
    List<CheckoutPostModel> checkoutLists = await checkoutDatabase.getCheckoutPosts();
    
    // Assuming inTime is in the format 'yyyy-MM-dd HH:mm:ss'
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    
    if (checkinList.isEmpty && checkoutLists.isEmpty) {
      return LastCheckinOutResponseModel(
        customerCode: "",
        message: 'No Checkin or Checkout found',
        status: true,
      );
    }
    
    checkinList.sort((a, b) {
      DateTime dateA = dateFormat.parse(a.inTime.toString());
      DateTime dateB = dateFormat.parse(b.inTime.toString());
      return dateB.compareTo(dateA); // Sort in descending order
    });
    
    // Sort checkoutLists by createdAt in descending order
    checkoutLists.sort((a, b) {
      DateTime dateA = dateFormat.parse(a.createdAt.toString());
      DateTime dateB = dateFormat.parse(b.createdAt.toString());
      return dateB.compareTo(dateA); // Sort in descending order
    });
    
    // Now you can use the sorted lists
    debugPrint('Sorted Checkin List first value: ${checkinList.first.toJson().toString()}');
    debugPrint('Sorted Checkin List Last value: ${checkinList[0].toJson().toString()}\n\n\n');
    debugPrint('Sorted Checkout List First Value: ${checkoutLists.first.createdAt.toString()}');
    debugPrint('Sorted Checkout List Last Value: ${checkoutLists[1].createdAt.toString()}');
    
    // TRUE FOR CHECKIN SCREEN
    if (checkinList.isNotEmpty && checkoutLists.isNotEmpty) {
      DateTime checkinFirstInTime = dateFormat.parse(checkinList.first.inTime.toString());
      DateTime checkoutFirstCreatedAt = dateFormat.parse(checkoutLists.first.createdAt.toString());
      bool sameData = isSameDay(DateTime.parse(checkinList.first.inTime.toString()), DateTime.parse(checkoutLists.first.createdAt.toString()));
      bool isCheckoutAfterCheckin = checkinFirstInTime.isAfter(checkoutFirstCreatedAt);
    
      if (sameData) {
        if (isCheckoutAfterCheckin && checkinList.first.customerid.toString() == customerId) {
          // Assuming the date format is 'yyyy-MM-dd HH:mm:ss'
          final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    
          // Convert both to DateTime
          DateTime checkinFirstInTime = dateFormat.parse(checkinList.first.inTime.toString());
    
          // Compare the DateTime objects
          CheckinPostModel checkinPostModel = checkinList.where((element) => element.farmId == checkoutLists.first.farmId).first;
          debugPrint(checkinPostModel.toJson().toString());
    
          return LastCheckinOutResponseModel(
            customerCode: checkinPostModel.customerid.toString(),
            message: 'Checkin and Checkout found',
            status: false,
          );
        } else {
          return LastCheckinOutResponseModel(
            customerCode: checkinList.first.customerid.toString(),
            message: 'No Checkin or Checkout found',
            status: true,
          );
        }
      } else {
        return LastCheckinOutResponseModel(
          customerCode: checkinList.first.customerid.toString(),
          message: 'No Checkin or Checkout found',
          status: true,
        );
      }
    } else {
      return LastCheckinOutResponseModel(
        customerCode: "",
        message: 'No Checkin or Checkout found',
        status: true,
      );
    }
  }
}

  @override
  Future<List<Customermodel>> searchCustomer(
      {required String searchKey}) async {
    try {
      final response = await dioClient.post(
        Endpoints.searchCustomer,
        data: {"custName": searchKey},
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
  Future<List<AssignedToModel>> getAssignedLists(
      {required ZoneModel zoneModel}) async {
    try {
      final response = await dioClient.post(
        Endpoints.assignedToUrl,
        headers: {},
        data: {
          "zoneId": zoneModel.zoneId.toString(),
        },
      );
      if (response.statusCode == 200) {
        final List data = response.data['body'];
        final List<AssignedToModel> assignedToList = data.isEmpty
            ? []
            : data.map((e) => AssignedToModel.fromJson(e)).toList();
        return assignedToList;
      } else {
        throw NetworkExceptions.getDioException(response.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<CustomerCreatedResponseModel> createCustomer(
      {required CustomerCreatePostModel customerCreatePostModel}) async {
    final result = await connectionChecker.isConnected();
    if (result) {
      debugPrint(customerCreatePostModel.toJson().toString());
      try {
        final response = await dioClient.post(
          Endpoints.createCustomer,
          data: customerCreatePostModel.toJson(),
          headers: {},
        );

        if (response.statusCode == 201) {
          return CustomerCreatedResponseModel.fromJson(response.data);
        } else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        logger.e(e);
        throw NetworkExceptions.getDioException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  @override
  Future<List<CustomerCodeModel>> getApprovedCustomerList() async {
    try {
      final results =
          await dioClient.get(Endpoints.approvedCustomerUrl, headers: {});

      if (results.statusCode == 200) {
        final List data = results.data['customers'];

        final List<CustomerCodeModel> approvedCustomerList =
            data.map((e) => CustomerCodeModel.fromJson(e)).toList();
        return approvedCustomerList;
      } else {
        throw NetworkExceptions.getDioException(results.data);
      }
    } on DioException catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<List<JoinEmployeModel>> getJointEmployeList() async {
    logger.d('JOINT EMPLOYES API STARTED');
    final results = await connectionChecker.hasInternet();
    final database = JointEmployeDatabase();
    logger.d('CHECKING INTERNET');
    //  TODO: REMOVE ! FROM RESULTS
    if (results) {
      logger.d('INTERNET AVAILABLE');
      try {
        final response =
            await dioClient.get(Endpoints.jointemployesUrl, headers: {});

        if (response.statusCode == 200) {
          final List data = response.data['data'];
          final List<JoinEmployeModel> employeeList =
              data.map((e) => JoinEmployeModel.fromJson(e)).toList();

          for (var employee in employeeList) {
            await database.insertJoinEmploye(employee);
          }
          return employeeList;
        } else {
          throw NetworkExceptions.getDioException(response.data);
        }
      } on DioException catch (e) {
        throw NetworkExceptions.getDioException(e);
      }
    } else {
      logger.d('NO INTERNET CONNECTION');
      logger.d('LOADING DATA FROM OFFLINE');
      List<JoinEmployeModel> employeeList = await database.getJoinEmployes();
      return employeeList;
    }
  }
}
