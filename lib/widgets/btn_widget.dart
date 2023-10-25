import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    required this.width,
    required this.btnColor,
    required this.text,
    required this.textColor,
    required this.onTap,
  });

  final double width;
  final Color btnColor;
  final String text;
  final Color textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width * 0.2,
      height: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: btnColor,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withOpacity(0.5),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: width * 0.1,
            ),
          ),
        ),
      ),
    );
  }
}

class BtnWidgetForZero extends StatelessWidget {
  const BtnWidgetForZero({
    super.key,
    required this.width,
    required this.btnColor,
    required this.text,
    required this.textColor,
    required this.onTap,
  });

  final double width;
  final Color btnColor;
  final String text;
  final Color textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width * 0.45,
      height: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: btnColor,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withOpacity(0.5),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: width * 0.075,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: width * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
