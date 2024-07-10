import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/shared.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

abstract class ZoneRepo {
  Future<Either<NetworkExceptions,List<ZoneModel>>> getAllZones();
}