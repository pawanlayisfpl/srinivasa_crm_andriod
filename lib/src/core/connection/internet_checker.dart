import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class InternetChecker {
  InternetChecker(this.connectivity);
  final Connectivity connectivity;

  Future<bool> hasInternet() async {
    final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult.isEmpty ? false : true;
  }

  Future<bool> isConnected() async {
 final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult.isEmpty ? false : true;
  }
}
