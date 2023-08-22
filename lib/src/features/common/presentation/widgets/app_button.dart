import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      required this.onTap,
      this.elevation = 2,
      this.buttonWidth = double.infinity,
      this.leading,
      this.trailing});
  final Color buttonColor;
  final VoidCallback onTap;
  final double elevation;
  final double buttonWidth;
  final Widget? leading;
  final Widget? trailing;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: Material(
        elevation: elevation,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                leading ?? const SizedBox.shrink(),
                Expanded(
                    child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
                trailing ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
