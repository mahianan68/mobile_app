import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.5, 0.9],
          colors: [
            Color.fromARGB(255, 1, 62, 91),
            Color.fromARGB(255, 0, 25, 37),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Mobile app functionalities.",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          const SizedBox(height: 10),
          buildBulletPoint("Student registration"),
          SizedBox(height: 2),
          buildBulletPoint("Check visa Status"),
          SizedBox(height: 2),
          buildBulletPoint("Contact with counsellor"),
          SizedBox(height: 2),
          buildBulletPoint("Get updated about latest events"),
          SizedBox(height: 2),
          buildBulletPoint("Select the flight date"),
          const SizedBox(height: 20),
          const Text(
            "", // Add your content here
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0, right: 8.0),
          child: Text(
            '\u2022', // Unicode character for bullet point
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
