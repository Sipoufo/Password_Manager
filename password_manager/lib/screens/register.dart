import 'package:flutter/material.dart';
import 'package:password_manager/controllers/auth_controller.dart';
import 'package:password_manager/models/token.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/screens/login.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/utils/local_storage.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _name;
  late String _email;
  late String _password;
  late AuthController auth;
  bool isLoading = false;

  @override
  void initState() {
    _name = "";
    _email = "";
    _password = "";
    auth = AuthController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
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
                              "REGISTER",
                              style: TextStyle(
                                fontFamily: "BebasNeue",
                                fontSize: 64,
                                color: NeutralDark,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Let’s get you setup with a new account!",
                              style: TextStyle(
                                fontSize: 12,
                                color: NeutralGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Input(
                            label: "Name",
                            placeholder: "xxxx",
                            onChange: (value) {
                              _name = value;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Input(
                            label: "Email",
                            placeholder: "xxx@xxx.xxx",
                            onChange: (value) {
                              _email = value;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Input(
                            label: "Password",
                            placeholder: "Password",
                            onChange: (value) {
                              _password = value;
                            },
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Button(
                            text: "REGISTER",
                            haveBg: true,
                            isLarge: true,
                            onPress: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Token token =
                                  await auth.register(_email, _name, _password);
                              LocalStorage().addValue("token", token.token);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                  (Route<dynamic> route) => false);
                              setState(() {
                                isLoading = false;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: NeutralDark),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Primary,
                                fontFamily: "BebasNeue",
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
