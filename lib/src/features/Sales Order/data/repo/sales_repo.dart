import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/extensions/date_extension.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/particular_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/payment_mode_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/pending_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/price_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/product_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/sales_order_approve_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/sales_order_reject_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/soc_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_approve_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/sales_reject_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/soc_create_post_model.dart';

import '../../../../../shared/data/datasource/DeliveryTypes/delivery_type_model.dart';
import '../../domain/model/get/view_sales_order_model.dart';

abstract class SalesRepo {
  Future<Either<NetworkExceptions, List<ProductsModel>>> getAllProducts();
  Future<Either<NetworkExceptions, List<UOMModel>>> getAllUom();
  Future<Either<NetworkExceptions,PriceModel>> getPriceByProductId(int productId,String customerId);
  Future<Either<NetworkExceptions, List<PaymentModeModel>>> getAllPaymentModes();
  Future<Either<NetworkExceptions, SaleOrderCreateResponseModel>>
      createSaleOrder({required SocCreatePostModel socCreatePostModel,required String deliveryText,required DeliveryTypeModel deliveryTypeModel});
  Future<Either<NetworkExceptions, ViewSalesOrderModel>> getAllSalesOrder();
  Future<Either<NetworkExceptions,ParticularSalesOrderModel>> getParticularSalesOrder(int orderId);   
  Future<Either<NetworkExceptions, SalesOrderApproveResponseModel>> approveSalesOrder({required SalesApprovePostModel salesApprovePostModel});
  Future<Either<NetworkExceptions, SalesOrderRejectResponseModel>> rejectSalesOrder({required SalesRejectPostModel salesRejectPostmodel});
  Future<Either<NetworkExceptions,PendingOrdersModel>> getPendingOrders();
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
    debugPrint('GET ALL PROUDCTS API STARTED');
    var status = await internetChecker.hasInternet();
    if (status) {
      debugPrint('INTERNET CONNECTION IS AVAILABLE');

      try {
        final response =
            await dioClient.get(Endpoints.getAllProducts, headers: {});
        if (response.statusCode == 200) {
          debugPrint('GET ALL PROUDCTS API SUCCESSFULL');
          final List<ProductsModel> productList = [];
          response.data.forEach((element) {
            productList.add(ProductsModel.fromJson(element));
          });
          return Right(productList);
        } else {
          debugPrint('GET ALL PROUDCTS API FAILED');
          return Left(NetworkExceptions.getDioException(response.data));
        }
      } on DioException catch (e) {
        debugPrint('GET ALL PROUDCTS API FAILED WITH ${e.toString()}');
        debugPrint(e.toString());
        return Left(NetworkExceptions.getDioException(e));
      }
    } else {
      debugPrint('INTERNET CONNECTION IS DISABLED');
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, List<UOMModel>>> getAllUom() async {
    debugPrint('GET ALL UOM API STARTED');
    var status = await internetChecker.hasInternet();
    if (status) {
      debugPrint('INTERNET CONNECTION IS AVAILABLE');
      try {
        final response = await dioClient.get(Endpoints.getAllUom, headers: {});
        if (response.statusCode == 200) {
          debugPrint('GET ALL UOM API SUCCESSSS');
          if (response.statusCode == 200) {
            debugPrint('GET ALL UOM API SUCCESS');
            final List<UOMModel> uomList = [];
            for (var element in response.data) {
              uomList.add(UOMModel.fromJson(element));
            }
            return Right(uomList);
          } else {
            debugPrint('GET ALL UOM API FAILED');
            return Left(NetworkExceptions.getDioException(response.data));
          }
        } else {
          debugPrint('GET ALL UOM API IS FAILEDD');
          return Left(NetworkExceptions.getDioException(response.data));
        }
      } on DioException catch (e) {
        debugPrint('GET ALL UOM API FAILEDD WITH EXCEPTIONNN ${e.toString()}');
        debugPrint(e.toString());
        return Left(NetworkExceptions.getDioException(e));
      }
    } else {
      debugPrint('INTERNET CONNECTION IS DISABLEDÍ');
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, PriceModel>> getPriceByProductId(int productId,String customerId) async {
   try {
    final response = await dioClient.post(Endpoints.getProductPriceById,data: {
      "customerId" : customerId,
      "productId" : productId
    }, headers: {});
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
  
  @override
  Future<Either<NetworkExceptions, SaleOrderCreateResponseModel>> createSaleOrder({required SocCreatePostModel socCreatePostModel,required String deliveryText,required DeliveryTypeModel deliveryTypeModel})  async {
   final results = await internetChecker.isConnected();
   if(results) {
    try{

        var requestBody =     {
      // "customerCode": socCreatePostModel.customerCode,
      "customerId": socCreatePostModel.customerCode,
       "deliveryLocation" : deliveryText,
          "deliveryTypeId" : deliveryTypeModel.deliveryTypeId,
      "productDetails": socCreatePostModel.productDetails.isEmpty ? [] : socCreatePostModel.productDetails.map(((e) =>  {
          // "divisionId": e.divisionId,
          "productId": e.productId,
          "quantity": e.quantity,
          "rate": e.rate,
          "discountPerQuantity": e.discountPerQuantity,
          "getDiscountPerQuantityInPercent": e.discountPerQuantity,
          "totalAmount": e.totalAmount,
          "gstAmount": 0.00,
          "sellingRate": e.sellingRate,
          "uomId": e.uomId,
          "quantityToDeliver": e.quantity,
          "shipmentDate": e.shipmentDate.toFormattedDate(),
          // "ceHatchDate": e.ceHatchDate.toFormattedDate(),
         
          })).toList(),  
      // "productDetails": [
      //     {
      //     "divisionId": 4,
      //     "productId": 1,
      //     "quantity": 10,
      //     "rate": 52.38,
      //     "discountPerQuantity": 5.00,
      //     "getDiscountPerQuantityInPercent": 10.00,
      //     "totalAmount": 471.40,
      //     "gstAmount": 0.00,
      //     "sellingRate": 47.14,
      //     "uomId": 1,
      //     "quantityToDeliver": 10,
      //     "shipmentDate": "2024-07-20T10:00:00",
      //     "ceHatchDate": "2024-07-25T10:00:00"
      //     }
      // ],  
      "orderAmount": socCreatePostModel.orderAmount,
      "orderGstAmount": 0.0,
      "orderTotalAmount": socCreatePostModel.orderTotalAmount,
      "orderDiscountAmount": 0.0,
      "amountPaid": socCreatePostModel.amountPaid,
      "paymentModeId": socCreatePostModel.paymentModeId,
      "balanceAmount": socCreatePostModel.balanceAmount,
      "balanceAmountDueDate": socCreatePostModel.balanceAmountDueDate.isEmpty ?  "" : socCreatePostModel.balanceAmountDueDate.toFormattedDate(),
      "orderRemarks": socCreatePostModel.orderRemarks,
      // "assignTo": 0,
      "assignToRemarks": socCreatePostModel.assignToRemarks,
      "pendingPaymentDetails": socCreatePostModel.pendingPaymentDetails.isEmpty ? [] : socCreatePostModel.pendingPaymentDetails.map((e) => {
          "dueDate": e.dueDate,
          "amount": e.amount,
          "dueAmountPercentage": 100
          }).toList()
      };

    debugPrint(requestBody.toString());

      final response = await dioClient.post(Endpoints.createOrder, headers: {}, data: jsonEncode(requestBody) );
      if (response.statusCode == 201) {
        final SaleOrderCreateResponseModel saleOrderCreateResponseModel = SaleOrderCreateResponseModel.fromJson(response.data);
        return Right(saleOrderCreateResponseModel);
      } else {
        return Left(NetworkExceptions.getDioException(response.data));
      }
    } on DioException catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }

   }else {
    throw const NetworkExceptions.noInternetConnection();
   }
  }
  
  @override
  Future<Either<NetworkExceptions, ViewSalesOrderModel>> getAllSalesOrder() async {
    try {
      final response = await dioClient.get(Endpoints.getAllSalesOrders, headers: {});
      if (response.statusCode == 200) {
        final ViewSalesOrderModel viewSalesOrderModel = ViewSalesOrderModel.fromJson(response.data['data']);
        return Right(viewSalesOrderModel);
      } else {
        return Left(NetworkExceptions.getDioException(response.data));
      }
    } on DioException catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
   
  }
  
  @override
  Future<Either<NetworkExceptions, ParticularSalesOrderModel>> getParticularSalesOrder(int orderId) async  {
    try {
      final response = await dioClient.get(Endpoints.getParticularSaleModel+orderId.toString(),headers: {});
      if(response.statusCode == 200) {
       if(response.data['data'] != null) {
         final ParticularSalesOrderModel particularSalesOrderModel = ParticularSalesOrderModel.fromJson(response.data['data']);
        return Right(particularSalesOrderModel);
       }else {
        return left( NetworkExceptions.getDioException(response.data));
       }

      }else {
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
      
      throw left(NetworkExceptions.getDioException(e));
    }
  }
  
  @override
  Future<Either<NetworkExceptions, SalesOrderApproveResponseModel>> approveSalesOrder({required SalesApprovePostModel salesApprovePostModel})  async {
   try {
    debugPrint(' ORDERS APPROVE API STARTEDDD');
      final response = await dioClient.put(Endpoints.salesOrderReject,headers: {},data: salesApprovePostModel.toJson());

      if(response.statusCode == HttpStatus.ok) {
            debugPrint(' ORDERS APPROVE API IS SUCCESSFULL');

        final SalesOrderApproveResponseModel salesOrderApproveResponseModel = SalesOrderApproveResponseModel.fromJson(response.data);
        return right(salesOrderApproveResponseModel);
      }else {
            debugPrint(' ORDERS APPROVE API FAILEDD');
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
            debugPrint(' ORDERS APPROVE API FAILED ${e.error.toString()}');
      throw left(NetworkExceptions.getDioException(e));
      
    }
  }
  
  @override
  Future<Either<NetworkExceptions, SalesOrderRejectResponseModel>> rejectSalesOrder({required SalesRejectPostModel salesRejectPostmodel}) async {
    try {
       debugPrint(' ORDERS REJECT API STARTEDDD');
      final response = await dioClient.put(Endpoints.salesOrderReject,headers: {},data: salesRejectPostmodel.toJson());

      if(response.statusCode == HttpStatus.ok) {
        debugPrint(' ORDERS REJECT API IS SUCCESSFULL');
        final SalesOrderRejectResponseModel salesOrderRejectResponseModel = SalesOrderRejectResponseModel.fromJson(response.data);
        return right(salesOrderRejectResponseModel);
      }else {
        debugPrint(' ORDERS REJECT API FAILEDD');
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
      debugPrint(' ORDERS REJECT API FAILED');
      throw left(NetworkExceptions.getDioException(e));
      
    }
  }
  
  @override
  Future<Either<NetworkExceptions, PendingOrdersModel>> getPendingOrders()  async {
    debugPrint('PENDING ORDERS API STARTEDDD');
   final results = await internetChecker.isConnected();

   if(results ) {
    try {
      final response = await dioClient.get(Endpoints.getAllPenddingOrders,headers: {});

      if(response.statusCode == HttpStatus.ok) {
         debugPrint('PENDING ORDERS API IS SUCCESSFULL');
        final PendingOrdersModel pendingOrdersModel = PendingOrdersModel.fromJson(response.data['data']);
        return right(pendingOrdersModel);

      }else {
         debugPrint('PENDING ORDERS API FAILEDD');
        return left(NetworkExceptions.getDioException(response.data));
      }
      
    } on DioException catch (e) {
       debugPrint('PENDING ORDERS API FAIELDD');
      throw left(NetworkExceptions.getDioException(e));
      
    }

   }else {
    throw const NetworkExceptions.noInternetConnection();
   }
  }
}
