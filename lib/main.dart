import 'dart:async';

import 'package:flutter_ecom/start.dart';

Future<void> main() async {
  await start();
  // runZonedGuarded(() async => start, (error, stack) {
  //   // Log to firebase crashlytics
  //   log(error.toString(), stackTrace: stack);
  //   FirebaseCrashlytics.instance.recordError(error, stack);
  // });
}
