


import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Employe/employe_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';


@Injectable(as: EmployeRepo)
class EmployeRepoImpl implements EmployeRepo {
  final EmployeDataSource employeDataSource;

  EmployeRepoImpl({required this.employeDataSource});

  @override
  Future<Either<NetworkExceptions, List<EmployeeModel>>> getEmployeesList()  async{
    try {
      final results = await employeDataSource.getEmployesList();
      return Right(results);
      
    } on NetworkExceptions catch(e) {
      return Left(e);
      
    }
  }

}