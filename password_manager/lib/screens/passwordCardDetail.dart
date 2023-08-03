import 'package:flutter/material.dart';
import 'package:password_manager/controllers/user_controller.dart';
import 'package:password_manager/models/account.dart';
import 'package:password_manager/screens/home.dart';
import 'package:password_manager/screens/updatePassword.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/passwordItemInfo.dart';

class PasswordCardDetail extends StatefulWidget {
  final Account account;
  const PasswordCardDetail({super.key, required this.account});

  @override
  State<PasswordCardDetail> createState() => _PasswordCardDetailState();
}

class _PasswordCardDetailState extends State<PasswordCardDetail> {
  bool isLoading = false;
  UserController userController = UserController();

  _deleteAccount() async {
    await userController.deleteAccountController(widget.account.id);
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
                            "Not Compromised",
                            style: TextStyle(color: NeutralGray),
                          ),
                          Text(
                            widget.account.name,
                            style: const TextStyle(
                              fontFamily: "BebasNeue",
                              fontSize: 64,
                              color: NeutralDark,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          PasswordItemInfo(
                            icon: Icons.link,
                            info: widget.account.link,
                          ),
                          PasswordItemInfo(
                            icon: Icons.account_circle_outlined,
                            info: widget.account.username,
                          ),
                          PasswordItemInfo(
                            icon: Icons.lock_outline,
                            info: widget.account.password,
                            haveIcon: true,
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
                          haveBg: false,
                          text: "DELETE",
                          onPress: () {
                            setState(() {
                              isLoading = true;
                            });
                            _deleteAccount();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          },
                          isLarge: true,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Button(
                          haveBg: true,
                          text: "UPDATE",
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdatePassword(account: widget.account),
                              ),
                            );
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
