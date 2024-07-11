import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';

abstract class DivisionRepo {
  Future<Either<NetworkExceptions,List<DivisionModel>>> getDivisions();
}