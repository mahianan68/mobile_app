import 'package:flutter/material.dart';
import 'package:mobile_app/Login_file.dart';

class AuthPage extends StatelessWidget {
  const ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot){
    //user log in
  if(snapshot.hasData){
    return HomePage();
  }
  //user is not logged in
  else{
    return LoginPage();
  }
  }
    ));
  }
}
