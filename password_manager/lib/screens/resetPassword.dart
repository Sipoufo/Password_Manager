import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 35,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Logo.png"),
                        alignment: Alignment.topCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "RESET PASSWORD",
                        style: TextStyle(
                          fontFamily: "BebasNeue",
                          fontSize: 64,
                          color: NeutralDark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Input(
                      label: "NEW PASSWORD",
                      placeholder: "Password",
                      onChange: (value) {
                        _password = value;
                      },
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Button(
                      text: "RESET",
                      haveBg: true,
                      isLarge: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
