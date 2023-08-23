import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is StateController<int>) {
      debugPrint(
        '[${provider.name ?? provider.runtimeType}] value: ${newValue.state}',
      );
    }
  }
}
