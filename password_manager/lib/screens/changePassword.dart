import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 35,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: NeutralDark,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CHANGE PASSWORD",
                      style: TextStyle(
                        fontFamily: "BebasNeue",
                        fontSize: 64,
                        color: NeutralDark,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Input(
                      label: "OLD PASSWORD",
                      placeholder: "",
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Input(
                      label: "NEW PASSWORD",
                      placeholder: "",
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: const Button(
                        text: "RANDOMIZE",
                        haveBg: false,
                        isLarge: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
