import 'package:flutter/foundation.dart' show immutable;

@immutable
class RoutesLocation {
  const RoutesLocation._();

  static String get splash => '/splash';
  static String get auth => '/auth';
  static String get shop => '/shop';
  static String get explore => '/explore';
  static String get cart => '/cart';
  static String get favourite => '/favourite';
  static String get settings => '/settings';
  static String get profile => '/profile';
}
