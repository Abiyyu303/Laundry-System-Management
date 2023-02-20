import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? radius;
  final EdgeInsets? padding;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.foregroundColor,
    this.backgroundColor,
    this.radius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
        onPrimary: foregroundColor ?? Colors.white,
        primary: backgroundColor ?? ColorConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 55),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
      ),
    );
  }
}
