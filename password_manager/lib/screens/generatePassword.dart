import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class GeneratePassword extends StatefulWidget {
  const GeneratePassword({super.key});

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
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
                      "GENERATE NEW",
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
                      label: "",
                      placeholder: "",
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Input(
                      label: "PASSWORD LENGTH",
                      placeholder: "Website/App Name",
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Input(
                      label: "INCLUDE SYMBOLS",
                      placeholder: "Website/App Link",
                      onChange: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: const Button(
                            text: "RANDOMIZE",
                            haveBg: false,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: const Button(
                            text: "COPY",
                            haveBg: true,
                          ),
                        ),
                      ],
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
