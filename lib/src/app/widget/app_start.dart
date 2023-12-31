import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecom/firebase_options.dart';
import 'package:flutter_ecom/src/shared/shared.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@immutable
class AppStart {
  const AppStart._();
  static Future<ProviderContainer> init() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: binding);
    // Cache images in assets folder via using the Flutter Engine binding
    // lifecycle.
    binding.deferFirstFrame();
    binding.addPostFrameCallback((_) {
      final Element? context = binding.rootElement;
      if (context != null) {
        for (final asset in iconList) {
          final ff = asset.split('.');
          if (ff[1] == 'svg') {
            final ld = SvgAssetLoader(asset);
            svg.cache.putIfAbsent(ld.cacheKey(null), () => ld.loadBytes(null));
          } else {
            precacheImage(
              AssetImage(asset),
              context,
            );
          }
        }
      }
      binding.allowFirstFrame();
    });

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0x00FFFFFF)));

    final container = ProviderContainer(
      overrides: [],
      observers: [
        Logger(),
      ],
    );
    //await Future.wait([
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode);
    await initProviders(container);
    //]);
    // Non-async exceptions
    const fatalError = true;

    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    // Async exceptions
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
    FlutterNativeSplash.remove();
    return container;
  }
}
