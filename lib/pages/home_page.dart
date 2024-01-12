import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/auth/auth_page.dart';
import '/auth/login_page.dart';

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
            Container(
              margin: new EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
              alignment: AlignmentDirectional.topStart,
              width: double.maxFinite,
              height: 100,
              decoration: const BoxDecoration(),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/qsw.png",
                      height: 80,
                      width: 100,
                    ),
                    Container(
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
                  ]),
            ),
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
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 225, 210, 210),
                    ),
                    height: 25.0,
                    width: 100.0,
                    child: const Text('Hello', style: TextStyle(fontSize: 20)),
                    //hello button
                  ),
                  Container(
                    height: 100.0,
                    width: 400.0,

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
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('32dsrg')
                          ],
                        ),
                      ],
                    ),

                    //profile
                  )
                ],
              ),
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //     color: Color.fromARGB(255, 255, 0, 0),
            //     borderRadius: BorderRadius.all(Radius.circular(18)),
            //   ),
            //   child: TextButton(
            //       style: TextButton.styleFrom(fixedSize: const Size(180, 50)),
            //       onPressed: signUserOut,
            //       child: const Text(
            //         "Sign Out",
            //         style: TextStyle(
            //           fontSize: 20,
            //           color: Colors.white,
            //         ),
            //       )),
            // ),
            Container(
              height:600,
              margin: EdgeInsets.all(10),
              child: ListView(
                // This next line does the trick.
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
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
                        Text('Check VISA Status',style: TextStyle(
                          fontSize: 25,
                        ),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),

                      child: Image.asset(
                    "assets/intro/intropic.png",
                    height: 100,
                                    ),
                  ),                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),

                    margin: EdgeInsets.only(bottom: 10),
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

                          width:250,
                          child: Text('Airport Pickup Request',style: TextStyle(
                            fontSize: 25,
                          ),),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),

                          child: Image.asset(
                            "assets/intro/intropic.png",
                            height: 100,
                          ),
                        ),                      ],
                    ),
                  ),
                  Container(
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
                        Text('Q Study Event Calender',style: TextStyle(
                          fontSize: 25,
                        ),),
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

                ],
              ),
            ),

            // ElevatedButton(
            //     onPressed: () async {}, child: Text("Update Profile"))
          ],
        ),
      ),
    );
  }
}
