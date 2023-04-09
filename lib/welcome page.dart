import 'package:ds_group_project/listening_preferences.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'home_page.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0B132B),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 250.0,
                  child: Image.asset('assets/images/eMution.png'),
                ),
              ),
            ),
            // Image.asset('assets/images/dsgp_logo_3.png',height:300,width:300,),
            const Text("Hello there,",style:TextStyle(color:Color(0xFFFFFFFF),fontSize:20,fontFamily:'Inder-Regular' ),),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical:10),
              child: TypewriterAnimatedTextKit(
                text: const [
                  "Thank you for choosing us. We are happy to help you. You can either "
                      "let us scan your voice or face to detect your mood. Feel free to "
                      "tap the button below to get started..",
                ],
                textStyle: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontFamily: 'Inder-Regular',
                ),
                speed: Duration(milliseconds: 100),
                pause: Duration(seconds: 60),
              ),

              // child: Text("Thank you for choosing us. We are happy to help you."
              //     " You can either let us scan your voice or face to detect your"
              //     " mood. Feel free to tap the button below to get started..",
              //   style:TextStyle(color:Color(0xFFFFFFFF),fontSize:20,fontFamily:'Inder-Regular' ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:100,vertical:20),
              child: SizedBox(
                width:double.infinity,
                child:RawMaterialButton(
                  fillColor:const Color(0xFF5BC0BE),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ListeningPreference.id);
                  },
                  child:const Text("Get Started",style:TextStyle(
                    color: Colors.white,
                    fontFamily:'Inder-Regular',
                    fontSize:20,
                  ),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
