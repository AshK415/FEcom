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
