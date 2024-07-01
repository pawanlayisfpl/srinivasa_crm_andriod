// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/data/datasource/alert_remote_datasource.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_count_resonse_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/post/mark_alert_as_read_postmodel.dart';

import '../../domain/repo/alert_repo.dart';



@Injectable(as: AlertRepo)
class AlertRepoImpl extends AlertRepo {
  final AlertRemoteDataSource alertRemoteDataSource;

  AlertRepoImpl({
    required this.alertRemoteDataSource,
  });

  @override
  Future<Either<NetworkExceptions, AlertCountModel>> getAlertCount() async {
    try {
      final alertCount = await alertRemoteDataSource.getAlertCounts();
      return Right(alertCount);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, List<AlertModel>>> getAlerts() async {
    try {
      final alerts = await alertRemoteDataSource.getAlerts();
      return Right(alerts);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkExceptions, bool>> makAsRead({required MarkAlertAsReadPostModel markAlertAsReadPostModel}) async {
    try {
      final isMarked = await alertRemoteDataSource.markAsRead(markAlertAsReadPostModel: markAlertAsReadPostModel);
      return Right(isMarked);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

  
}
