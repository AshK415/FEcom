import 'package:flutter/material.dart';

extension WidgetExtension on double {
  Widget get hspace => SizedBox(
        height: this,
      );

  Widget get vspace => SizedBox(
        width: this,
      );

  Widget get div => Divider(
        height: this,
      );
}

extension IterableExtension<T> on Iterable<T> {
  /// Insert any item<T> inBetween the list items
  List<T> insertBetween(T item) => expand((e) sync* {
        yield item;
        yield e;
      }).skip(1).toList(growable: false);
}
