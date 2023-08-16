import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app/app.dart';

void main() async {
  runZonedGuarded<Future<void>>(
      () async {
        runApp(
          UncontrolledProviderScope(
            container: await AppStart.init(),
            child: const App(),
          ),
        );
      },
      (error, stack) {},
      zoneSpecification: ZoneSpecification(
        print: (self, parent, zone, line) {
          // Include a timestamp and the name of the App
          final messageToLog = "[${DateTime.now()}] FlutterEcom $line $zone";
          parent.print(zone, messageToLog);
        },
      ));
}

// Future<void> main() async {
//   await start();
//   // runZonedGuarded(() async => start, (error, stack) {
//   //   // Log to firebase crashlytics
//   //   log(error.toString(), stackTrace: stack);
//   //   FirebaseCrashlytics.instance.recordError(error, stack);
//   // });
// }
