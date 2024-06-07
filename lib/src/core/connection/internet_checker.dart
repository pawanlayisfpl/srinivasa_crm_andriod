import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class InternetConnectionChecker {
  InternetConnectionChecker(this.connectivity);
  final Connectivity connectivity;

  Future<bool> hasInternet() async {
    final connectivityResult = await connectivity.checkConnectivity();

    return connectivityResult != ConnectivityResult.none;
  }
}
