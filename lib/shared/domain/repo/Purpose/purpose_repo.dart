import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Purpose/purpose_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

abstract class PurposeRepo {
  Future<Either<NetworkExceptions,List<PurposeModel>>> getAllPurpose();
}