import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EncylopideaScreen extends StatefulWidget {
  const EncylopideaScreen({super.key});

  @override
  State<EncylopideaScreen> createState() => _EncylopideaScreenState();
}

class _EncylopideaScreenState extends State<EncylopideaScreen> {
  Color backgroundColor = const Color(0xffe9edf1);
  Color secondaryColor = const Color(0xffe1e6ec);
  Color accentColor = const Color(0xff2d5765);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Center(
                      child: const Text(
                        'Encyclopedia',
                        style: TextStyle(
                          fontFamily: 'odibeeSans',
                          // letterSpacing: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lightbulb_rounded,
                          size: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: const Text(
                            'Read more about crop diseases and preventive care measures',
                            style: TextStyle(
                              // letterSpacing: 10,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Apple+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/eapple.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              20,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Apple',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Bell+Pepper+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/ebellpepper.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Bell Pepper',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Cherry+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/echerry.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Cherry',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Corn+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/ecorn.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Corn',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Grape+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/egrapes.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Grape',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Peach+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/epeach.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Peach',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Potato+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/epotato.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Potato',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Rice+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/erice.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Rice',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String urls = "https://www.google.com/search?q="
                                'Tomato+plant+diseases+and+preventive+care+measures';
                            Uri url = Uri.parse(urls);
                            await launchUrl(url, mode: LaunchMode.inAppWebView);
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/etomato.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              20,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Text(
                                  'Tomato',
                                  style: TextStyle(
                                    color: backgroundColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
