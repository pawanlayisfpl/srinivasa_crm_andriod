import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/assigned_to_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkIn_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkout_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_code_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_created_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_full_details_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/last_checkin_out_respone_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkin_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/checkout_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/post/customer_create_post_model.dart';

import '../../../../../shared/domain/model/zone_model.dart';
import '../model/get/customer_model.dart';
import '../model/get/customer_response_model.dart';
import '../model/get/joint_employe_model.dart';

abstract class CustomerRepo {
  Future<Either<NetworkExceptions, CustomerResponseModel>> getCustomers();
  Future<Either<NetworkExceptions, CustomerResponseModel>> getAllCustomerDemo();
  Future<Either<NetworkExceptions, Customermodel>> getCustomerById(int id);
  Future<Either<NetworkExceptions, CheckInResponseModel>> checkIn(
      {required CheckinPostModel checkinPostModel});
  Future<Either<NetworkExceptions, CheckoutResponseModel>> checkOut(
      {required CheckoutPostModel checkoutPostModel});
  Future<Either<NetworkExceptions, LastCheckinOutResponseModel>>
      getLastCheckInCheckoutDetails({required String customerId,required String farmId});
  Future<Either<NetworkExceptions, List<Customermodel>>?> searchCustomer(
      {required String searchKey});
  Future<Either<NetworkExceptions, CustomerFullDetailsModel>>
      getCustomerFullDetails({required String customerCode});

  Future<Either<NetworkExceptions,CustomerCreatedResponseModel>> createCustomer({required CustomerCreatePostModel customerCreatePostModel});

 Future<Either<NetworkExceptions,List<AssignedToModel>>> getAssignedList({required ZoneModel zoneModel});     


 Future<Either<NetworkExceptions,List<CustomerCodeModel>> > getApprovedCustomerList();

 Future<Either<NetworkExceptions,List<JoinEmployeModel>>> getJointEmployeList();
}
