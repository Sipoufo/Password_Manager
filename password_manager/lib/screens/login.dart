import 'package:flutter/material.dart';
import 'package:password_manager/controllers/auth_controller.dart';
import 'package:password_manager/models/token.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/screens/forgetPassword.dart';
import 'package:password_manager/screens/register.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/utils/local_storage.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email = "";
  late String _password = "";
  late AuthController auth;
  bool isLoading = false;

  @override
  void initState() {
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
                              "LOGIN",
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
                              "Let’s get you setup with your account!",
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
                            isPassword: true,
                            onChange: (value) {
                              _password = value;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: Primary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Button(
                            text: "LOGIN",
                            haveBg: true,
                            isLarge: true,
                            onPress: () async {
                              setState(() {
                                isLoading = true;
                              });
                              Token token = await auth.login(_email, _password);
                              LocalStorage().addValue("token", token.token);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                                (Route<dynamic> route) => false,
                              );
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
                            "Don’t have an account yet?",
                            style: TextStyle(color: NeutralDark),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: Primary,
                                fontFamily: "BebasNeue",
                                fontSize: 18,
                              ),
                            ),
                          ),
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
