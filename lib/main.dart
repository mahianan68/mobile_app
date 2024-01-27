import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/pages/student_home.dart';
import 'package:mobile_app/pages/test.dart';
import 'firebase_options.dart';

import 'intro_screens/onboarding_screen.dart';
import 'pages/adminhome.dart';
import 'pages/apointmentlist.dart';
import 'pages/home_page.dart';
import 'pages/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final Future<FirebaseApp> _initialization = Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Firestore CRUD',
            theme: ThemeData(

            ),
            debugShowCheckedModeBanner: false,
            home: OnboardingScreen(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
