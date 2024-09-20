import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@injectable
class InternetChecker {
  InternetChecker(this.connectivity, this.internetConnectionChecker);
  final Connectivity connectivity;
  final InternetConnectionChecker internetConnectionChecker;
  

  Future<bool> hasInternet() async {
    

      bool isConnected = await InternetConnectionChecker().hasConnection;
      return isConnected;

  }

  Future<bool> isConnected() async {
 final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult.isEmpty ? false : true;
  }
}