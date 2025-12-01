import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/core/utils/styles.dart';

class ConfirmDepositField extends StatelessWidget {
  final String label;
  final int? maxLines;
  final bool enabled;
  final bool isRequired;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const ConfirmDepositField({
    super.key,
    required this.label,
    this.enabled = true,
    this.maxLines = 1,
    this.isRequired = false,
    this.controller,
    this.initialValue,
    this.hintText,
    this.keyboardType,
    this.validator,
  }) : assert(
          controller == null || initialValue == null,
          'controller and initialValue cannot be provided together',
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: interMediumDefault.copyWith(
                fontSize: 14,
                color: MyColor.colorBlack,
              ),
            ),
            if (isRequired) ...[
              const SizedBox(width: 4),
              Text(
                '*',
                style: interMediumDefault.copyWith(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          controller: enabled ? controller : null,
          initialValue: enabled ? null : initialValue,
          readOnly: !enabled,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          style: interMediumDefault.copyWith(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: MyColor.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
