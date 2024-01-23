import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:crud/pages/update_student_page.dart';
import 'package:intl/intl.dart';

class ListStudentPage extends StatefulWidget {
  ListStudentPage({Key? key}) : super(key: key);

  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final Stream<QuerySnapshot> scheduleStream =
      FirebaseFirestore.instance.collection('schedule').snapshots();

  // CollectionReference schedule =
  // FirebaseFirestore.instance.collection('schedule');
  // Future<void> deleteUser(id) {
  //   // print("User Deleted $id");
  //   return schedule
  //       .doc(id)
  //       .delete()
  //       .then((value) => print('User Deleted'))
  //       .catchError((error) => print('Failed to Delete user: $error'));
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: scheduleStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (var i = 0; i < storedocs.length; i++) ...[
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 216, 0)),
                      child: Column(
                        children: [
                          Text(storedocs[i]['name'],
                              style: TextStyle(fontSize: 18.0)),
                      Text(
                        DateFormat('dd/MM/yyyy').format(storedocs[i]['selectedDate'].toDate()), // Format selectedDate
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(storedocs[i]['settingDate'].toDate()), // Format settingDate
                        style: TextStyle(fontSize: 18.0),),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        });
  }
}
