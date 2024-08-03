import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
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
                      'SIGNUP',
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'odibeeSans',
                      ),
                    ),
                  ),
                  onPressed: signup,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
