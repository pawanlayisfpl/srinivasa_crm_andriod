import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';

import '../../../../src/core/model/model.dart';

abstract class PrimarySourceRepo {
  Future<Either<NetworkExceptions, List<PrimarySourceModel>>> getPrimarySources();
}