import 'package:flutter/material.dart';
import 'package:password_manager/screens/updatePassword.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/passwordItemInfo.dart';

class PasswordCardDetail extends StatefulWidget {
  const PasswordCardDetail({super.key});

  @override
  State<PasswordCardDetail> createState() => _PasswordCardDetailState();
}

class _PasswordCardDetailState extends State<PasswordCardDetail> {
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
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Not Compromised",
                      style: TextStyle(color: NeutralGray),
                    ),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(
                        fontFamily: "BebasNeue",
                        fontSize: 64,
                        color: NeutralDark,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PasswordItemInfo(
                      icon: Icons.calendar_today_outlined,
                      info: "25 May 2022",
                    ),
                    PasswordItemInfo(
                      icon: Icons.link,
                      info: "www.facebook.com",
                    ),
                    PasswordItemInfo(
                      icon: Icons.account_circle_outlined,
                      info: "james.smith@mail.gg",
                    ),
                    PasswordItemInfo(
                      icon: Icons.lock_outline,
                      info: "********",
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PasswordCardDetail(),
                        ),
                      );
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
                          builder: (context) => const UpdatePassword(),
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
