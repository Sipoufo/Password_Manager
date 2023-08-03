import 'package:flutter/material.dart';
import 'package:password_manager/controllers/user_controller.dart';
import 'package:password_manager/screens/generatePassword.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class AddNewPassword extends StatefulWidget {
  const AddNewPassword({super.key});

  @override
  State<AddNewPassword> createState() => _AddNewPasswordState();
}

class _AddNewPasswordState extends State<AddNewPassword> {
  bool isLoading = false;
  UserController userController = UserController();
  String name = "";
  String link = "";
  String username = "";
  String password = "";

  _createAccount() async {
    if (name != "" || link != "" || username != "" || password != "") {
      await userController.createAccountController(
          name, link, username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
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
                            "ADD NEW",
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
                            label: "Name",
                            placeholder: "Website/App Name",
                            defaultValue: name,
                            onChange: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Input(
                            label: "URL",
                            placeholder: "Website/App Link",
                            onChange: (value) {
                              setState(() {
                                link = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Input(
                            label: "EMAIL/USERNAME",
                            placeholder: "Email / Username",
                            onChange: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Input(
                            label: "PASSWORD",
                            placeholder: "Password",
                            isPassword: true,
                            onChange: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Button(
                              text: "Generate New",
                              haveBg: false,
                              onPress: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const GeneratePassword(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Button(
                          haveBg: true,
                          text: "ADD PASSWORD",
                          onPress: () {
                            setState(() {
                              isLoading = true;
                            });
                            _createAccount();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          },
                          isLarge: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
