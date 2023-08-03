import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/controllers/password.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/inputNumber.dart';

class GeneratePassword extends StatefulWidget {
  const GeneratePassword({super.key});

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  String passwordResult = "";
  int passwordLength = 4;
  int symbols = 2;
  Password password = Password();

  @override
  void initState() {
    _generatePassword();
    super.initState();
  }

  _generatePassword() {
    setState(() {
      passwordResult = password.generatePassword(passwordLength, symbols);
    });
  }

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
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        border: Border.all(
                          width: 2,
                          color: Neutral,
                        ),
                      ),
                      child: Text(
                        passwordResult,
                        style:
                            const TextStyle(color: NeutralDark, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputNumber(
                      label: "PASSWORD LENGTH",
                      placeholder: "Website/App Name",
                      defaultValue: "$passwordLength",
                      onChange: (value) {
                        setState(() {
                          passwordLength = int.parse(value);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputNumber(
                      label: "SYMBOLS LENGTH",
                      placeholder: "Website/App Link",
                      defaultValue: "$symbols",
                      onChange: (value) {
                        print(value);
                        setState(() {
                          symbols = int.parse(value);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Button(
                            text: "RANDOMIZE",
                            haveBg: false,
                            onPress: () {
                              _generatePassword();
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Button(
                            text: "COPY",
                            haveBg: true,
                            onPress: () {
                              Clipboard.setData(
                                  ClipboardData(text: passwordResult));
                            },
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
