import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final Function onChange;
  final bool isPassword;
  final bool isEnable;
  final String defaultValue;

  const Input({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onChange,
    this.isPassword = false,
    this.isEnable = true,
    this.defaultValue = "",
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
          enabled: isEnable,
          obscureText: isPassword ? true : false,
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
