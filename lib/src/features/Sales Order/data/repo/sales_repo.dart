import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/payment_mode_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/price_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/product_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';

abstract class SalesRepo {
  Future<Either<NetworkExceptions, List<ProductsModel>>> getAllProducts();
  Future<Either<NetworkExceptions, List<UOMModel>>> getAllUom();
  Future<Either<NetworkExceptions,PriceModel>> getPriceByProductId(int productId);
  Future<Either<NetworkExceptions, List<PaymentModeModel>>> getAllPaymentModes();
}

@Injectable(as: SalesRepo)
class SaleRepoImpl implements SalesRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;
  final Logger logger;

  SaleRepoImpl(
      {required this.dioClient,
      required this.keyValueStorage,
      required this.internetChecker,
      required this.logger});

  @override
  Future<Either<NetworkExceptions, List<ProductsModel>>>
      getAllProducts() async {
    logger.d('GET ALL PROUDCTS API STARTED');
    var status = await internetChecker.hasInternet();
    if (status) {
      logger.d('INTERNET CONNECTION IS AVAILABLE');

      try {
        final response =
            await dioClient.get(Endpoints.getAllProducts, headers: {});
        if (response.statusCode == 200) {
          logger.d('GET ALL PROUDCTS API SUCCESSFULL');
          final List<ProductsModel> productList = [];
          response.data.forEach((element) {
            productList.add(ProductsModel.fromJson(element));
          });
          return Right(productList);
        } else {
          logger.d('GET ALL PROUDCTS API FAILED');
          return Left(NetworkExceptions.getDioException(response.data));
        }
      } on DioException catch (e) {
        logger.d('GET ALL PROUDCTS API FAILED WITH ${e.toString()}');
        logger.e(e);
        return Left(NetworkExceptions.getDioException(e));
      }
    } else {
      logger.d('INTERNET CONNECTION IS DISABLED');
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, List<UOMModel>>> getAllUom() async {
    logger.d('GET ALL UOM API STARTED');
    var status = await internetChecker.hasInternet();
    if (status) {
      logger.d('INTERNET CONNECTION IS AVAILABLE');
      try {
        final response = await dioClient.get(Endpoints.getAllUom, headers: {});
        if (response.statusCode == 200) {
          logger.d('GET ALL UOM API SUCCESSSS');
          if (response.statusCode == 200) {
            logger.d('GET ALL UOM API SUCCESS');
            final List<UOMModel> uomList = [];
            for (var element in response.data) {
              uomList.add(UOMModel.fromJson(element));
            }
            return Right(uomList);
          } else {
            logger.d('GET ALL UOM API FAILED');
            return Left(NetworkExceptions.getDioException(response.data));
          }
        } else {
          logger.d('GET ALL UOM API IS FAILEDD');
          return Left(NetworkExceptions.getDioException(response.data));
        }
      } on DioException catch (e) {
        logger.d('GET ALL UOM API FAILEDD WITH EXCEPTIONNN ${e.toString()}');
        logger.e(e);
        return Left(NetworkExceptions.getDioException(e));
      }
    } else {
      logger.d('INTERNET CONNECTION IS DISABLEDÍ');
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, PriceModel>> getPriceByProductId(int productId) async {
   try {
    final response = await dioClient.get(Endpoints.getProductPriceById+productId.toString(), headers: {});
    if (response.statusCode == 200) {
      final PriceModel priceModel = PriceModel.fromJson(response.data);
      return Right(priceModel);
    } else {
      return Left(NetworkExceptions.getDioException(response.data));
    }
     
   } on DioException catch (e) {
    return Left(NetworkExceptions.getDioException(e));

     
   }
  }
  
  @override
  Future<Either<NetworkExceptions, List<PaymentModeModel>>> getAllPaymentModes() async  {
    try {
      final response = await dioClient.get(Endpoints.getAllPaymentModes, headers: {});
      if (response.statusCode == 200) {
        final List<PaymentModeModel> paymentModeList = [];
        response.data.forEach((element) {
          paymentModeList.add(PaymentModeModel.fromJson(element));
        });
        return Right(paymentModeList);
        
      } else {
        return Left(NetworkExceptions.getDioException(response.data));
      }
    } on DioException catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
