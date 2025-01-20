import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/all_employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_reporting_manager_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/single_employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/roles_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../model/Employe/employe_model.dart';

abstract class EmployeRepo {
  Future<Either<NetworkExceptions,List<EmployeeModel>>> getEmployeesList();
  Future<Either<NetworkExceptions,SingleEmployeModel>> getEmployeById({required String employeId});
  Future<Either<NetworkExceptions,List<RolesModel>>> getAllRoles();
  Future<Either<NetworkExceptions,AllEmployesModel?>> getAllGlobalEmployesList();
  Future<Either<NetworkExceptions,EmployeReportingManagerModel?>> getEmployeReportingMange(String zoneId);
}