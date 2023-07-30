import 'package:flutter/material.dart';
import 'package:password_manager/screens/changePassword.dart';
import 'package:password_manager/screens/editProfle.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/profileItemInfo.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 35, 15, 5),
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
                      "PROFILE",
                      style: TextStyle(
                        fontFamily: "BebasNeue",
                        fontSize: 64,
                        color: NeutralDark,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/images/profile.png"),
                                alignment: Alignment.topCenter,
                                fit: BoxFit.contain,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Primary, width: 2),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "SIPOUFO Yvan",
                            style: TextStyle(
                              fontFamily: "BebasNeue",
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "sipoufoknj@gmail.com",
                            style: TextStyle(
                              fontSize: 12,
                              color: NeutralGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ProfileItemInfo(
                      icon: Icons.account_circle_outlined,
                      info: "Update Profile",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ProfileItemInfo(
                      icon: Icons.lock_outline,
                      info: "Change Master Password",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ChangePassword(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const ProfileItemInfo(
                      icon: Icons.dark_mode_outlined,
                      info: "Switch to Dark Mode",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const ProfileItemInfo(
                      icon: Icons.login_outlined,
                      info: "Logout",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'v 1.0.0',
              style: TextStyle(color: NeutralGray),
            )
          ],
        ),
      ),
    );
  }
}
