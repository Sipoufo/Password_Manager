import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/screens/passwordCardDetail.dart';
import 'package:password_manager/utils/colors.dart';

class PasswordCard extends StatelessWidget {
  final String name;
  final String password;
  final PasswordCardDetail passwordCardDetail;
  const PasswordCard(
      {super.key,
      required this.name,
      required this.password,
      required this.passwordCardDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => passwordCardDetail),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Neutral, width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20, color: NeutralDark),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: password));
                },
                child: const Icon(
                  Icons.copy,
                  color: Primary,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
