import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/utils/colors.dart';

class InputNumber extends StatelessWidget {
  final String label;
  final String placeholder;
  final Function onChange;
  final String defaultValue;

  const InputNumber({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onChange,
    required this.defaultValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: "BebasNeue",
          ),
        ),
        TextFormField(
          initialValue: defaultValue,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: NeutralGray),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Neutral,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: NeutralGray,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
          ),
          onChanged: (value) {
            onChange(value);
          },
        ),
      ],
    );
  }
}
