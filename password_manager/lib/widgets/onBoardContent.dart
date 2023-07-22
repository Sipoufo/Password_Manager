import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';

class OnBoardContent extends StatelessWidget {
  final String title;
  final String description;
  const OnBoardContent(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(fontSize: 40, color: NeutralDark),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: const TextStyle(fontSize: 10, color: NeutralGray),
            ),
          ),
        ],
      ),
    );
  }
}
