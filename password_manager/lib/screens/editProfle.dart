import 'package:flutter/material.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/button.dart';
import 'package:password_manager/widgets/input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String _name;
  late String _email;

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
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
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
                          GestureDetector(
                            child: const Text(
                              "Change Picture",
                              style: TextStyle(fontSize: 12, color: Primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Input(
                      label: "NAME",
                      placeholder: "Enter Your Name",
                      onChange: (value) => {_name = value},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Input(
                      label: "EMAIL",
                      placeholder: "Enter Your Email",
                      onChange: (value) => {_name = value},
                    ),
                  ],
                ),
              ),
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
                    text: "CANCEL",
                    haveBg: false,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: const Button(
                    text: "SAVE",
                    haveBg: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
