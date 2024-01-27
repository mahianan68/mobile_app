import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/pages/student_home.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class CheckVisaBox extends StatefulWidget {
  const CheckVisaBox({super.key});

  @override

  State<CheckVisaBox> createState() => _CheckVisaBoxState();
}
// launchWhatsAppUri() async {
//   final link = WhatsAppUnilink(
//     phoneNumber: '+001-(555)1234567',
//     text: "Hey! I'm inquiring about the apartment listing",
//   );
//   // Convert the WhatsAppUnilink instance to a Uri.
//   // The "launch" method is part of "url_launcher".
//   await launchUrl(link.asUri());
// }
class _CheckVisaBoxState extends State<CheckVisaBox> {
  Future<void>? _launched;

  @override
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  Widget build(BuildContext context) {
    final Uri toLaunch =Uri(scheme: 'https', host: 'visa.educationmalaysia.gov.my', path: 'headers/');

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 0, 25, 37),
        leading: Image.asset(
          "assets/images/qsw.png",

          color: Color.fromARGB(255, 255, 255, 255),
        ),
        // centerTitle: false, // Ensure title is left-aligned if present
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.all(1),
        child: Container(
          color: Color.fromARGB(255, 35, 173, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined,color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));

                },

                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.home,color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  // Handle button press here
                },

                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.notification_important_outlined,
                  color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  // Handle button press here
                },
                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app_sharp
                  ,color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  // Handle button press here
                },
                iconSize: 36.0, // Optional icon size
              ),

            ],
          ),
        ),
      ),
      body: Expanded(
        child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.5, 0.9],
                colors: [
                  Color.fromARGB(255, 1, 62, 91),
                  Color.fromARGB(255, 0, 25, 37)
                ],
              ),
            ),
          child:ListView(children: [
            // GestureDetector(
            //   onTap: launchWhatsAppUri()
            //
            //   ,
            //   child: Container(
            //     margin: EdgeInsets.only(left:10,right:10,bottom:5,top:10),
            //     padding: EdgeInsets.only(left: 20),
            //     height: 120,
            //     decoration: const BoxDecoration(
            //       color: Color.fromARGB(255, 255, 216, 0),
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(20),
            //         bottomRight: Radius.circular(20),
            //         bottomLeft: Radius.circular(20),
            //         topLeft: Radius.circular(0),
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'Check Emgs Status',
            //           style: TextStyle(
            //             fontSize: 25,
            //           ),
            //         ),
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(25.0),
            //           child: Image.asset(
            //             "assets/intro/intropic.png",
            //             height: 100,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () => setState(() {
                _launched = _launchInBrowser(toLaunch);
              }),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.only(left:10,right:10,bottom:5,top: 10),
                height: 120,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 216, 0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        'Contact our counsellor',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(
                        "assets/intro/intropic.png",
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],)
        ),
      ),
    );
  }
}
