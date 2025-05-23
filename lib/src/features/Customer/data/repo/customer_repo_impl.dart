// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';

import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkIn_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkout_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_code_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_created_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_full_details_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/last_checkin_out_respone_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkin_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkout_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/customer_create_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/customer_full_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Update/domain/model/update_customer_post_model.dart';

import '../datasource/remote/customer_remote_datasources.dart';


@Injectable(as: CustomerRepo)
class CustomerRepoImpl implements CustomerRepo {
  final CustomerRemoteDataSource customerRemoteDataSource;
  CustomerRepoImpl({
    required this.customerRemoteDataSource,
  });

  @override
  Future<Either<NetworkExceptions, CheckInResponseModel>> checkIn({required CheckinPostModel checkinPostModel}) async {
    try {
      final result = await customerRemoteDataSource.checkIn(checkinPostModel:checkinPostModel );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, CheckoutResponseModel>> checkOut({required CheckoutPostModel checkoutPostModel}) async {
   try {
      final result = await customerRemoteDataSource.checkOut(checkoutPostModel:checkoutPostModel );
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, CustomerResponseModel>> getAllCustomerDemo() async {
   try {
    final results = await customerRemoteDataSource.getCustomers();
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
     
   }
  }

  @override
  Future<Either<NetworkExceptions, Customermodel>> getCustomerById(int id) async {
    try {
      final results = await customerRemoteDataSource.getCustomerById(id);
      return Right(results);
      
    } on NetworkExceptions catch (e) {

      return Left(e);

      
    }
  }

  @override
  Future<Either<NetworkExceptions, CustomerFullDetailsModel>> getCustomerFullDetails({required String customerCode}) async {
   try {
    final results = await customerRemoteDataSource.getCustomerFullDetails(customerCode: customerCode);
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
     
   }
  }

  @override
  Future<Either<NetworkExceptions, CustomerResponseModel>> getCustomers() async {
    try {
      final result = await customerRemoteDataSource.getCustomers();
      return Right(result);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, LastCheckinOutResponseModel>> getLastCheckInCheckoutDetails({required String customerId,required String farmId})  async{
    try {
    final results = await customerRemoteDataSource.getLastCheckInCheckoutDetails(customerId: customerId, farmId: farmId);
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
     
   }
  }

  @override
  Future<Either<NetworkExceptions, List<Customermodel>>?> searchCustomer({required String searchKey})  async{
    try {
    final results = await customerRemoteDataSource.searchCustomer(searchKey: searchKey);
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
     
   }
  }

  @override
  Future<Either<NetworkExceptions, List<AssignedToModel>>> getAssignedList({required ZoneModel zoneModel}) async {
    try {
    final results = await customerRemoteDataSource.getAssignedLists(zoneModel: zoneModel );
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
  }
  }
  
  @override
  Future<Either<NetworkExceptions, CustomerCreatedResponseModel>> createCustomer({required CustomerCreatePostModel customerCreatePostModel}) async {
     try {
    final results = await customerRemoteDataSource.createCustomer(customerCreatePostModel: customerCreatePostModel);
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
  }
   
  }

  @override
  Future<Either<NetworkExceptions, List<CustomerCodeModel>>> getApprovedCustomerList()  async{
try {
    final results = await customerRemoteDataSource.getApprovedCustomerList();
    return Right(results);
     
   } on  NetworkExceptions catch(e) {
    return Left(e);
  }
  }

  @override
  Future<Either<NetworkExceptions, List<JoinEmployeModel>>> getJointEmployeList()  async {
   try{
    final results = await customerRemoteDataSource.getJointEmployeList();
    return Right(results);

   }on NetworkExceptions catch(e){
     return Left(e);
   }
  }

  @override
  Future<Either<NetworkExceptions, CustomerFullDetailsResponseModel?>> getCustomerDetailsByFarmId({required String farmid})  async {
     
     try {
       
       final results = await customerRemoteDataSource.getCustomerDetailsByFarmid(farmid: farmid);
      return right(results);
     } on NetworkExceptions catch (e) {
      return left(e);
       
     }

  }
  
  @override
  Future<Either<NetworkExceptions, bool>> updateCustomer({required UpdateCustomerPostModel updateCustomerPostModel}) async {
   try {
       
       final results = await customerRemoteDataSource.updateCustomer(updateCustomerPostModel: updateCustomerPostModel);
      return right(results);
     } on NetworkExceptions catch (e) {
      return left(e);
       
     }
  }

  

}
