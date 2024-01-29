import 'package:flutter/material.dart';
import 'package:mobile_app/pages/student_home.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

class FaqS extends StatefulWidget {
  const FaqS({super.key});

  @override
  State<FaqS> createState() => _FaqSState();
}

class _FaqSState extends State<FaqS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 62, 91),

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
                  onPressed: (){},
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FaqS()));
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
      body: Container(
        child: Accordion(

          headerBorderColor: Colors.blueGrey,
          headerBorderColorOpened: Colors.transparent,
          // headerBorderWidth: 1,
          headerBackgroundColorOpened: Colors.green,
          contentBackgroundColor: Colors.white,
          contentBorderColor: Colors.green,
          contentBorderWidth: 3,
          contentHorizontalPadding: 20,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
          const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 20,
              leftIcon:
              const Icon(Icons.text_fields_rounded, color: Colors.white),
              header: const Text('Simple Text',),
              content: const Text('loremIpsufgd gds dg sdfg sdgf dgf fdg dfg m',),
            ),
        
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
