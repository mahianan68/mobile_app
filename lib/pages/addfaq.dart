import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/pages/faq2.dart';

import '../auth/authmain.dart';
import 'adminhome.dart';
import 'faq.dart';
import 'notifications.dart';

class AddFaq extends StatefulWidget {
  const AddFaq({super.key});

  @override
  State<AddFaq> createState() => _AddFaqState();
}

class _AddFaqState extends State<AddFaq> {
  final _formKey = GlobalKey<FormState>();
  var fquestion = "";
  var fanswer = "";
  final fquestionController = TextEditingController();
  final fanswerController = TextEditingController();

  CollectionReference faq = FirebaseFirestore.instance.collection('faq');

  Future<void> addFaq() {
    return faq
        .add({
          'fquestion': fquestion,
          'fanswer': fanswer,
        })
        .then((value) => print('question Added'))
        .catchError((error) => print('Failed to Add question: $error'));
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
            margin: EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 35, 173, 4),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: TextButton(
                style: TextButton.styleFrom(fixedSize: const Size(120, 40)),
                onPressed: () {},
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
                          builder: (context) => Ahome()));

                },

                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.question_mark_rounded,color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FaqS2()));// Handle button press here
                },

                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.notification_important_outlined,
                  color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotiFications()));
                },
                iconSize: 36.0, // Optional icon size
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app_rounded
                  ,color: Color.fromARGB(255, 255, 216, 0),), // Replace with your desired icon
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                iconSize: 36.0, // Optional icon size
              ),

            ],
          ),
        ),
      ),
      body: Container(

        height: double.infinity,

        padding: EdgeInsets.all(20),
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: fquestionController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                  labelStyle:
                      TextStyle(color: Colors.white), // Change label color

                  labelText: 'Enter the Question',
                ),
              ),
              SizedBox(height: 20), // Add spacing between fields
              TextField(
                style: TextStyle(color: Colors.white),

                controller: fanswerController,
                maxLines: 7, // Or set a specific number of lines
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  fillColor: Colors.transparent, // Set the background color
                  filled: true,

                  labelStyle:
                      TextStyle(color: Colors.white), // Change label color
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  labelText: 'Enter the answer',
                ),
              ),
              SizedBox(height: 20), // Add spacing between fields

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        fquestion = fquestionController.text;
                        fanswer = fanswerController.text;

                        addFaq();
                      });
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Ahome()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 173, 4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Question',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
