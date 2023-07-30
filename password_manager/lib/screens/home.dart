import 'package:flutter/material.dart';
import 'package:password_manager/screens/addNewPassword.dart';
import 'package:password_manager/screens/passwordCardDetail.dart';
import 'package:password_manager/screens/profile.dart';
import 'package:password_manager/utils/colors.dart';
import 'package:password_manager/widgets/passwordCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 14),
                            decoration: const BoxDecoration(
                              color: Neutral,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 70,
                                      color: Primary,
                                      fontFamily: "BebasNeue"),
                                ),
                                Text(
                                  "Passwords Stored",
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 14),
                            decoration: const BoxDecoration(
                              color: Neutral,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 70,
                                      color: Primary,
                                      fontFamily: "BebasNeue"),
                                ),
                                Text(
                                  "Passwords Compromised",
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: NeutralGray,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: NeutralGray,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: NeutralGray,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      hintText: 'Search Websites...',
                      hintStyle: const TextStyle(color: NeutralGray),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const PasswordCard(
                        name: "Facebook",
                        password: "facebook",
                        passwordCardDetail: PasswordCardDetail(),
                      );
                    },
                  ),
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: 130,
                  //       height: 130,
                  //       decoration: const BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage("assets/images/Search.png"),
                  //           alignment: Alignment.topCenter,
                  //           fit: BoxFit.contain,
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 30,
                  //     ),
                  //     const Text(
                  //       "NO RESULTS",
                  //       style: TextStyle(
                  //         color: NeutralDark,
                  //         fontFamily: "BebasNeue",
                  //         fontSize: 24,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //     const Text(
                  //       "We couldn’t find anything. Try searching for something else.",
                  //       style: TextStyle(
                  //         color: NeutralGray,
                  //         fontSize: 16,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ],
                  // ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    height: 80,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Neutral,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.home_outlined,
                                        size: 30, color: NeutralDark),
                                    Container(
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: NeutralDark,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Profile(),
                                    ),
                                  );
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      size: 30,
                                      color: NeutralDark,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddNewPassword(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Primary,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
