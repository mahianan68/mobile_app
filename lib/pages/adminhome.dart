import 'package:flutter/material.dart';
import 'package:mobile_app/pages/eventcal.dart';

import 'student_list.dart';

class Ahome extends StatefulWidget {
  const Ahome({super.key});

  @override
  State<Ahome> createState() => _AhomeState();
}

class _AhomeState extends State<Ahome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 0, 25, 37),
        title: Image.asset(
                  "assets/images/qsw.png",
                  height: 60,
                  width: 100,
                ),
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
            //   margin: new EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            //   alignment: AlignmentDirectional.topStart,
            //   width: double.maxFinite,
            //   height: 100,
            //   decoration: const BoxDecoration(),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Image.asset(
            //           "assets/images/qsw.png",
            //           height: 80,
            //           width: 100,
            //         ),
            //       ]),
            // ),
            Container(
              height: 600,
              margin: EdgeInsets.all(10),
              child: ListView(
                // This next line does the trick.
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StudentList()));
                    },
                    child: Container(
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
                          Text(
                            'Student List',
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EventCal()));
                    },
                    child: Container(
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
                            width: 250,
                            child: Text(
                              'Apintment Calender',
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EventCal()));
                    },
                    child: Container(
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
                          Container(
                            width: 250,
                            child: Text(
                              'Query',
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding:EdgeInsets.all(1),
        child: Container(
          color: Color.fromARGB(255, 35, 173, 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("A"),
              Text("B"),
              Text("C"),
              Text("D"),
            ],
          ),
        ),
      ),
    );
  }
}
