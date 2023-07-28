import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class OnBoardIndicator extends StatelessWidget {
  final bool isActive;
  final String letter;
  const OnBoardIndicator(
      {super.key, this.isActive = false, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Text(
      letter,
      style: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: isActive ? 24 : 16,
        color: isActive ? Primary : NeutralGray,
      ),
    );
  }
}
