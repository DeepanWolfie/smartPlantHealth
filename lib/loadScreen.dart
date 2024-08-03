import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_plant_health/authPage.dart';
import 'package:smart_plant_health/loginpage.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthPage()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/app_icon.png"))),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Plant Disease Analysor",
              style: TextStyle(
                fontSize: 45,
                fontFamily: 'odibeeSans',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text("LOADING....")
        ]),
      ),
    );
  }
}
