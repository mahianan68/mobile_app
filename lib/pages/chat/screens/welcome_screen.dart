import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../components/colors.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/tabbutton_widget.dart';



class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animationcurve;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this,

      );
      animationcurve =
          CurvedAnimation(parent: controller, curve: Curves.decelerate);
      controller.forward();

      controller.addListener(() {
        setState(() {

        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(animationcurve.value / 2),
                BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 120.0,
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 10),
                child: Text(
                    "Instantly chat with friends",

                ),

              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 0.8),
                child: Text(
                    "Shaping the future through chat.Keep your favourites a touch away",

                ),

              ),
              SizedBox(
                height: 22.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Hero(
                  tag: "button",
                  child: TabButton(
                    btnColor: PalletteColors.primaryRed,
                    btnTxtColor: Colors.white,
                    btnText: "Create new account",

                    btnFunction: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade,
                          child: RegistrationScreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: Hero(
                  tag: "button2",
                  child: TabButton(
                    btnColor: PalletteColors.lightBlue,
                    btnTxtColor: Colors.black,
                    btnText: "Login with email",

                    btnFunction: () {
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.fade, child: LoginScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 28.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Text(
                        "©2021,ArunBalajiR",

                    ),

                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


}

