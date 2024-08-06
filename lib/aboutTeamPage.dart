import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutTeamScreen extends StatefulWidget {
  const AboutTeamScreen({super.key});

  @override
  State<AboutTeamScreen> createState() => _AboutTeamScreenState();
}

class _AboutTeamScreenState extends State<AboutTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Lottie.network(
                  "https://lottie.host/ee0100a3-935f-4eb8-937f-f717767eafd7/LWEQ6Pc841.json",
                ),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "deepan L",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
                Text(
                  "S Arunkumar",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
                Text(
                  "D chandu",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "VTU27119",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
                Text(
                  "VTU27199",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
                Text(
                  "VTU27279",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 25,
                    fontFamily: 'odibeeSans',
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
