import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final bool haveBg;
  final bool isLarge;

  const Button({
    super.key,
    this.onPress,
    required this.text,
    required this.haveBg,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width:
            isLarge ? double.infinity : MediaQuery.of(context).size.width / 2.3,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        decoration: BoxDecoration(
          color: haveBg ? Primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Primary, width: 2.0),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18,
              color: haveBg ? Colors.white : Primary,
              fontFamily: 'BebasNeue'),
        ),
      ),
    );
  }
}
