import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CommonNotificationChannel {
 static  const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  // 'This channel is used for important notifications.', // description
  importance: Importance.max,
);





}