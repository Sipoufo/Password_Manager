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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 56,
                  color: NeutralDark,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: const TextStyle(fontSize: 12, color: NeutralGray),
            ),
          ),
        ],
      ),
    );
  }
}
