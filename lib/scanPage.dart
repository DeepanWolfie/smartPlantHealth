import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Column(children: [
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
  
      ],)),
    );
  }
}