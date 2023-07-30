import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final Function onChange;
  final bool isPassword;
  final bool isEnable;
  const Input({
    super.key,
    required this.label,
    required this.placeholder,
    required this.onChange,
    this.isPassword = false,
    this.isEnable = true,
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
        TextField(
          scrollPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).viewInsets.bottom),
          enabled: isEnable,
          // keyboardType: TextInputType.datetime,
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
