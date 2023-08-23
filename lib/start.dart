import 'package:flutter/widgets.dart';
import 'package:flutter_ecom/src/app/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> start() async {
  runApp(
    UncontrolledProviderScope(
      container: await AppStart.init(),
      child: const App(),
    ),
  );
}
