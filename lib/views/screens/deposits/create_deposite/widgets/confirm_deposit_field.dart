import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/styles.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_theme_extension.dart';

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
                color: context.depositPrimaryTextColor,
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
          style: interMediumDefault.copyWith(
            fontSize: 16,
            color: context.depositPrimaryTextColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.depositBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.depositBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: context.depositPrimaryButtonBackground),
            ),
          ),
        ),
      ],
    );
  }
}
