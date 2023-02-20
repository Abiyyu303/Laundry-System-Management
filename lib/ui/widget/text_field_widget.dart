import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool? obscureText;
  final bool filled;
  final bool isBorder;
  final double? radius;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.obscureText,
    this.filled = false,
    this.isBorder = false,
    this.radius,
    this.validator,
    this.inputType,
    this.maxLines,
  }) : super(key: key);

  factory TextFieldWidget.filled({
    required TextEditingController controller,
    String? label,
    String? hint,
    bool? obscureText,
    double? radius,
    FormFieldValidator<String>? validator,
    TextInputType? inputType,
    int? maxLines,
  }) {
    return TextFieldWidget(
      controller: controller,
      label: label,
      hint: hint,
      obscureText: obscureText,
      filled: true,
      isBorder: false,
      radius: radius,
      validator: validator,
      inputType: inputType,
      maxLines: maxLines,
    );
  }

  factory TextFieldWidget.border({
    required TextEditingController controller,
    String? label,
    String? hint,
    bool? obscureText,
    double? radius,
    Color? borderColor,
    FormFieldValidator<String>? validator,
    TextInputType? inputType,
    int? maxLines,
  }) {
    return TextFieldWidget(
      controller: controller,
      label: label,
      hint: hint,
      obscureText: obscureText,
      filled: false,
      isBorder: true,
      radius: radius,
      validator: validator,
      inputType: inputType,
      maxLines: maxLines,
    );
  }

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
        ],
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: widget.obscureText ?? false,
          maxLines: widget.maxLines ?? 1,
          decoration: InputDecoration(
            hintText: widget.hint ?? '',
            filled: widget.filled,
            fillColor: ColorConstant.primary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.radius ?? 10),
              ),
              borderSide: widget.isBorder
                  ? const BorderSide(width: 1)
                  : BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
