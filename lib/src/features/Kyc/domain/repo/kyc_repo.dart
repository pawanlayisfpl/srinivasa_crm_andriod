import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';

abstract class KycRepo {
  Future<Either<NetworkExceptions,List<CustomerKycModel>>> getPendingKyuCustomers();
}