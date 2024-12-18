import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_particular_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/get/ticket_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/data/model/post/ticket_create_post_model.dart';

import '../model/get/view_ticket_resposne_model.dart';

abstract class TicketsRepo {
  Future<Either<NetworkExceptions,TicketResponseModel>> createTickets({required TicketCreatePostModel ticketCreatePostModel});
  Future<Either<NetworkExceptions,ViewTicketResponseModel>> getTickets() ; 
  Future<Either<NetworkExceptions,ViewParticularTicketModel>> getTicketsById({required int ticketId}) ;
}



@Injectable(as: TicketsRepo)
class TicketsRepoImpl implements TicketsRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  TicketsRepoImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  
  @override
  Future<Either<NetworkExceptions, TicketResponseModel>> createTickets({required TicketCreatePostModel ticketCreatePostModel}) async {
   final status = await internetChecker.hasInternet();

   if(status) {
    final response = await dioClient.post(Endpoints.createTicket,data: ticketCreatePostModel.toJson(),headers: {});

    if(response.statusCode == 200 || response.statusCode == 201) {
      TicketResponseModel ticketResponseModel = TicketResponseModel.fromJson(response.data);
      return right(ticketResponseModel);

    }else {
      return left(NetworkExceptions.getDioException(response.data));
    }

   }else {
    return left(const NetworkExceptions.noInternetConnection());
   }
  }
  
  @override
  Future<Either<NetworkExceptions, ViewTicketResponseModel>> getTickets() async  {
    final status = await internetChecker.hasInternet();

    if(status) {
      try {
        // TODO: CHANGE ENDPOINT TO LIVE ENDPOINT GET TICKETS
        final response = await dioClient.get(Endpoints.createTicket,headers: {});

        if(response.statusCode == 200) {
          ViewTicketResponseModel viewTicketResponseModel = ViewTicketResponseModel.fromJson(response.data);

          return right(viewTicketResponseModel);

        }else {
          return left(NetworkExceptions.getDioException(response.data));
        }
        
        
      } on DioException catch (e) {
        return left(NetworkExceptions.getDioException(e));
        
      }

    }else {
      return left(const NetworkExceptions.noInternetConnection());
    }
    
  }
  
  @override
  Future<Either<NetworkExceptions, ViewParticularTicketModel>> getTicketsById({required int ticketId})  async {
    
    final status = await internetChecker.hasInternet();

    if(status) {
      try {
        final response = await dioClient.get(Endpoints.createTicket + '${ticketId.toString()}',headers: {});

        if(response.statusCode == 200) {
          ViewParticularTicketModel viewParticularTicketModel = ViewParticularTicketModel.fromJson(response.data['data']);

          return right(viewParticularTicketModel);
        }else {
          return left(NetworkExceptions.getDioException(response.data));
        }
        
      } on DioException catch (e) {
        return left(NetworkExceptions.getDioException(e));
        
      }
      
    }else {
      return left(const NetworkExceptions.noInternetConnection());
    }
  }
  
 

}