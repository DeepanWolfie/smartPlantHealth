import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_plant_health/leadScan.dart';

class ScanItemPage extends StatefulWidget {
  const ScanItemPage({super.key});

  @override
  State<ScanItemPage> createState() => _ScanItemPageState();
}

class _ScanItemPageState extends State<ScanItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/58375-plantas-y-hojas.json"),

            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/apple-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Apple'),
                      ),
                    );
                  },
                  title: const Text(
                    'Apple',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/bell-pepper-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'BellPepper'),
                      ),
                    );
                  },
                  title: const Text(
                    'Bell Pepper',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/cherry-svgrepo-com(1).svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Cherry'),
                      ),
                    );
                  },
                  title: const Text(
                    'Cherry',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/corn-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeafScan(modelName: 'Corn'),
                      ),
                    );
                  },
                  title: const Text(
                    'Corn',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/grapes-grape-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Grape'),
                      ),
                    );
                  },
                  title: const Text(
                    'Grape',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/peach-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Peach'),
                      ),
                    );
                  },
                  title: const Text(
                    'Peach',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/potato-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Potato'),
                      ),
                    );
                  },
                  title: const Text(
                    'Potato',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/sheaf-of-rice-svgrepo-com(1).svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeafScan(modelName: 'Rice'),
                      ),
                    );
                  },
                  title: const Text(
                    'Rice',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/tomato-svgrepo-com.svg',
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LeafScan(modelName: 'Tomato'),
                      ),
                    );
                  },
                  title: const Text(
                    'Tomato',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
