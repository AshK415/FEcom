import 'dart:ui';

import 'package:flutter/widgets.dart';

class GlassButton extends StatelessWidget {
  const GlassButton(
      {super.key,
      required this.child,
      required this.onClick,
      this.isPressed = false});
  final Widget child;
  final VoidCallback onClick;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0Xffffffff).withOpacity(isPressed ? 0.4 : 0.5),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 2)),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
