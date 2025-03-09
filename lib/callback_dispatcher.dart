import 'dart:isolate';
import 'dart:ui';

import 'package:ticketmaster/utils/logger.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      // Perform API call or other background task
      SendPort? sendPort = IsolateNameServer.lookupPortByName('backgroundPort');
      sendPort?.send('API call successful');
      log.d('API call successful');
    } catch (error) {
      SendPort? sendPort = IsolateNameServer.lookupPortByName('backgroundPort');
      sendPort?.send('API call error: $error');
      log.d('API call error: $error');
    }
    return Future.value(true);
  });
}
