import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ds_group_project/rounded_button.dart';
import 'package:ds_group_project/sign%20in%20page.dart';
import 'package:flutter/material.dart';
import 'loging_screen.dart';

class Splash extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState()
  {
    super.initState();
    // _navigatetohome();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      // upperBound: 100.0
    );
    animation = ColorTween(begin: Colors.white, end: Color(0xFF0B132B)).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }
  // _navigatetohome()async
  // {
  //   await Future.delayed(const Duration(milliseconds:3000),(){});
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  // }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor:const Color(0xFF0B132B),
      // body:Center(
      //   child: Container(
      //     child: Image.asset('assets/images/dsgp_logo_3.png')
      //   ),
      // ),

      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/eMution.png'),
                    width: 100.0,
                  ),
                ),
                TyperAnimatedTextKit(
                  text: ['eMution_'],
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log In', color: Color(0xFF5BC0BE),
              onPressed: ()
              {
                //Go to login screen.
                Navigator.pushNamed(
                    context, HomeScreen.id
                );
              },),
            RoundedButton(title: 'Register', color: Color(0xFF3A506B),
              onPressed: ()
              {
                //Go to login screen.
                Navigator.pushNamed(
                    context, SignInPage.id
                );
              },),
          ],
        ),
      ),


    );
  }
}
