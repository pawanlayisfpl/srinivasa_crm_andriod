import 'package:battery_plus/battery_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommonBattery {

  Future<int> getBatteryLevel () async {
    var battery = Battery();
    print(await battery.batteryLevel);
    return await battery.batteryLevel;


  }

}