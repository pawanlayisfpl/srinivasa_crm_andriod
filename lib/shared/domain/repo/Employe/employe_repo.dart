import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../model/Employe/employe_model.dart';

abstract class EmployeRepo {
  Future<Either<NetworkExceptions,List<EmployeeModel>>> getEmployeesList();
}