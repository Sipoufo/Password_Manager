import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final bool haveBg;
  const Button(
      {super.key, this.onPress, required this.text, required this.haveBg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        decoration: BoxDecoration(
          color: haveBg ? Primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Primary, width: 2.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: haveBg ? Colors.white : Primary,
          ),
        ),
      ),
    );
  }
}
