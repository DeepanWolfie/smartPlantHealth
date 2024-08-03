// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_plant_health/aboutTeamPage.dart';
import 'package:smart_plant_health/encylopideaPage.dart';
import 'package:smart_plant_health/scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool animate = true;
  final user = FirebaseAuth.instance.currentUser!;

  Color backgroundColor = const Color(0xffe9edf1);
  Color secondaryColor = const Color(0xffe1e6ec);
  Color accentColor = const Color(0xff2d5765);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      animate = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        animate = false;
      });
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/app_icon.svg',
                    width: 30,
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Disease dedector",
                      style: TextStyle(
                        fontFamily: 'odibeeSans',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            LottieBuilder.asset(
              'assets/45869-farmers.json',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                    elevation: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ScanItemPage()));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 140,
                                width: 200,
                                child: LottieBuilder.asset(
                                  "assets/scanLeaf.json",
                                  repeat: animate,
                                )),
                            const Text(
                              "SCAN",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 25,
                                fontFamily: 'odibeeSans',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Card(
                    elevation: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EncylopideaScreen()));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                                height: 140,
                                width: 200,
                                child: LottieBuilder.asset(
                                  "assets/teee.json",
                                  repeat: animate,
                                )),
                            const Text(
                              "Encylopidea",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 25,
                                fontFamily: 'odibeeSans',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutTeamScreen()));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140,
                              width: 200,
                              child: LottieBuilder.network(
                                  // "assets/scanLeaf.json",
                                  "https://lottie.host/49adaf32-b5db-4345-8087-154581c9bae1/PnlPNJDSjX.json",
                                  repeat: animate),
                            ),
                            const Text(
                              "About team",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 25,
                                fontFamily: 'odibeeSans',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                  onPressed: logout,
                  child: Text("Logout ${user.email}"),
                )) /*
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: LottieBuilder.asset(
                          'assets/45869-farmers.json',
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(LinearBorder.none)),
                        child: const Center(
                          child: Text(
                            'SCAN',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'odibeeSans',
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScanPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: LottieBuilder.asset(
                          'assets/45869-farmers.json',
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(LinearBorder.none)),
                        child: const Center(
                          child: Text(
                            'Read more about plant disease',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'odibeeSans',
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: LottieBuilder.asset(
                          'assets/45869-farmers.json',
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(LinearBorder.none)),
                        child: const Center(
                          child: Text(
                            'About Project members',
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'odibeeSans',
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
             */
          ],
        )),
      ),
    );
  }
}
