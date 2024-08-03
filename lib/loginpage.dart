import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_plant_health/forgetPassword.dart';
import 'package:smart_plant_health/homePage.dart';
import 'package:smart_plant_health/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/45869-farmers.json',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    hintText: "EMAIL",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    focusedBorder: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent))),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.greenAccent),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(LinearBorder.none)),
                    child: const Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          overflow: TextOverflow.clip,
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'odibeeSans',
                        ),
                      ),
                    ),
                    onPressed: signin

                    // () {
                    //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //   //     builder: (context) => const HomeScreen()));
                    //   signin();
                    // },
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 5,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.greenAccent])),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 5,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.white])),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                    },
                    child: const Text('SignUp')),
                const Text("  Froget Password? "),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen()));
                    },
                    child: const Text('Click Here')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
