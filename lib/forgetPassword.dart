import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  void forget() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
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
                      'REQ',
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'odibeeSans',
                      ),
                    ),
                  ),
                  onPressed: forget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
