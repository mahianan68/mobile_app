import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/auth/auth_page.dart';
import 'package:mobile_app/pages/eventcal.dart';
import 'package:mobile_app/pages/student_registration.dart';
import '/auth/login_page.dart';
import 'checkvisabox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        toolbarHeight: 100,
        backgroundColor: Color.fromARGB(255, 0, 25, 37),
        leading: Image.asset(
          "assets/images/qsw.png",

          color: Color.fromARGB(255, 255, 255, 255),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right:20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 35, 173, 4),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                    fixedSize: const Size(120, 40)),
                onPressed: signUserOut,
                child: const Text(
                  "Consultancy",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Container(
            //   child : const Text("do you want to sign out "),

            // ),
            // Text('Signed in as ' + user.email!),

            // Image.asset(
            //   "assets/intro/intropic.png",
            //   height: 400,
            // ),
            Container(
              height: 130.0,
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 225, 210, 210),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left:10,top:10),

                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 25.0,
                    width: 100.0,
                    child: const Text('Hello', style: TextStyle(fontSize: 20)),
                    //hello button
                  ),
                  Container(
                    height: 90.0,
                    margin: EdgeInsets.only(left:10,right:10,bottom:5),

                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 252, 252, 252),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              "assets/intro/intropic.png",
                              height: 100,
                              width: 100,
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Azizul Alam',
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 35,
                              padding: EdgeInsets.all(0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(0, 35, 173, 4),
                                borderRadius: BorderRadius.all(Radius.circular(2)),
                              ),
                              child: TextButton(

                                  onPressed:  () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegisterStudent()));
                                  },
                                  child: const Text(
                                    "Complete profile",
                                    style: TextStyle(

                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //profile
                  )
                ],
              ),
            ),
             SizedBox(height:20),
            Expanded(
              child: ListView(
                // This next line does the trick.
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckVisaBox()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left:10,right:10,bottom:5),
                      padding: EdgeInsets.only(left: 20),
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
                          Text(
                            'Check VISA Status',
                            style: TextStyle(
                              fontSize: 25,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventCal()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left:10,right:10,bottom:5),
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
                              'Q study Event Calender',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventCal()));
                    },
                    child: Container(
                      padding:EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left:10,right:10,bottom:5),
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
                              'Airport Pickup Request',
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
                ],
              ),
            ),

            // ElevatedButton(
            //     onPressed: () async {}, child: Text("Update Profile"))
          ],
        ),
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
    );
  }
}
