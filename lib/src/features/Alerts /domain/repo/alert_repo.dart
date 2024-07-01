import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_count_resonse_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/post/mark_alert_as_read_postmodel.dart';

abstract class AlertRepo {

  Future<Either<NetworkExceptions, List<AlertModel>>> getAlerts();  
  Future<Either<NetworkExceptions,AlertCountModel>> getAlertCount();
  Future<Either<NetworkExceptions,bool>> makAsRead({required MarkAlertAsReadPostModel markAlertAsReadPostModel});
}