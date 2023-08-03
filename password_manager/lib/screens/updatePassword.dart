import 'package:flutter/material.dart';
import 'package:password_manager/controllers/user_controller.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/screens/generatePassword.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class UpdatePassword extends StatefulWidget {
  final Account account;
  const UpdatePassword({super.key, required this.account});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool isLoading = false;
  UserController userController = UserController();
  String name = "";
  String link = "";
  String username = "";
  String password = "";

  @override
  void initState() {
    name = widget.account.name;
    link = widget.account.link;
    username = widget.account.username;
    password = widget.account.password;
    super.initState();
  }

  _updateAccount() async {
    if (name != "" || link != "" || username != "" || password != "") {
      await userController.updateAccountController(
          name, link, username, password, widget.account.id);
    }
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
                      "UPDATE",
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
                      defaultValue: widget.account.name,
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
                      defaultValue: widget.account.link,
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
                      defaultValue: widget.account.username,
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
                      defaultValue: widget.account.password,
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
                              builder: (context) => const GeneratePassword(),
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
                    text: "SAVE UPDATE",
                    onPress: () {
                      setState(() {
                        isLoading = true;
                      });
                      _updateAccount();
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
