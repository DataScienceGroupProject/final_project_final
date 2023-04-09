
import 'package:ds_group_project/listening_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ds_group_project/sign%20in%20page.dart';
import 'package:ds_group_project/welcome%20page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'design.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  late String email;
  late String password;
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  //
  // @override
  // void dispose()
  // {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B132B),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: 300.0,
                  height: 200,
                  child: Image.asset('assets/images/eMution.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            // RoundedButton(title: 'Log In', color: Colors.lightBlueAccent,
            //   onPressed: () async {
            //   try {
            //     final user = await _auth.signInWithEmailAndPassword(
            //         email: email, password: password);
            //     if (user != null) {
            //       Navigator.pushNamed(context, ChatScreen.id);
            //     }
            //   }
            //   catch (e){
            //     print(e);
            //   }
            //
            //   },
            // ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // textStyle: TextStyle(fontSize: 24),
                  // minimumSize: Size.fromHeight(72),
                  shape: StadiumBorder(),
                  backgroundColor: Color(0xFF5BC0BE),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Log In'),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }
                  catch (e){
                    print(e);
                  }

                },
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  // Code to handle forgot password functionality
                  Navigator.pushNamed(context, SignInPage.id);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white, // set the color of the text
                    decoration: TextDecoration.underline, // add an underline to the text
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
    //   backgroundColor:const Color(0xFF0B132B),
    //   body:Center(
    //     child:Column(
    //       children: [
    //         Image.asset('assets/images/dsgp_logo_3.png',height:250,width:250,),
    //         const Text("Hello Again,",style:TextStyle(color:Color(0xFFFFFFFF),fontSize:20,fontFamily:'Inder-Regular' ),),
    //         Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color:const Color(0xFF5D6978),
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: const Padding(
    //               padding: EdgeInsets.symmetric(horizontal:10),
    //               child: TextField(
    //                 // controller:emailController,
    //                 style:TextStyle(color:Color(0xFFFFFFFF)),
    //                 decoration: InputDecoration(
    //                   border:InputBorder.none,
    //                   hintText:"Enter your email here",
    //                   hintStyle:TextStyle(
    //                       color:Color(0xFFFFFFFF),
    //                   fontFamily:'Inder-Regular')
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color:const Color(0xFF5D6978),
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: const Padding(
    //               padding: EdgeInsets.symmetric(horizontal:10),
    //               child: TextField(
    //                 // controller: passwordController,
    //                 obscureText:true,
    //                 style:TextStyle(color:Color(0xFFFFFFFF)),
    //                 decoration: InputDecoration(
    //                     border:InputBorder.none,
    //                     hintText:"Enter your password here",
    //                     hintStyle:TextStyle(
    //                         color:Color(0xFFFFFFFF),
    //                         fontFamily:'Inder-Regular')
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const Text("Forgot Password ?",style:TextStyle(color:Color(0xFFFFFFFF),fontSize:15,fontFamily:'Inder-Regular' ),),
    //         const SizedBox(height:20,),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal:120),
    //           child: SizedBox(
    //             width:double.infinity,
    //             child:RawMaterialButton(
    //             fillColor:const Color(0xFF5BC0BE),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15)
    //             ),
    //             onPressed:(){
    //               Navigator.of(context).push(MaterialPageRoute(builder:(_){
    //                 return const welcome_screen();
    //               }));
    //
    //             },
    //
    //             child:const Text("Log in",style:TextStyle(
    //               fontFamily:'Inder-Regular',
    //               fontSize:20,
    //             ),),
    //           ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal:120),
    //           child: SizedBox(
    //             width:double.infinity,
    //             child:RawMaterialButton(
    //               fillColor:const Color(0xFF3A506B),
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(15)
    //               ),
    //               onPressed: () {
    //                 Navigator.of(context).push(MaterialPageRoute(builder:(_){
    //                   return  SignInPage();
    //                 }));
    //               },
    //               child:const Text("Sign in",style:TextStyle(
    //                 fontFamily:'Inder-Regular',
    //                 fontSize:20,
    //                 color:Color(0xFFFFFFFF)
    //               ),),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height:12),
    //         Row(
    //           crossAxisAlignment:CrossAxisAlignment.center ,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const [
    //            Expanded(child:Padding(
    //              padding: EdgeInsets.symmetric(horizontal:15),
    //              child: Divider(
    //                color:Colors.white,
    //                height:40,
    //              ),
    //            )),
    //             Text("Sign in with",style:TextStyle(
    //               color:Colors.white,
    //               fontSize:15,
    //               fontFamily:'Inder-Regular'
    //             ),),
    //             Expanded(child:Padding(
    //               padding: EdgeInsets.symmetric(horizontal:15),
    //               child: Divider(
    //                 color:Colors.white,
    //               ),
    //             ))
    //           ],
    //         ),
    //         const SizedBox(height:10,),
    //         SignInButton(
    //           Buttons.Facebook,
    //           shape:RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10)) ,
    //           onPressed: (){},
    //         ),
    //
    //         SignInButton(
    //           Buttons.Google,
    //           shape:RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)) ,
    //           onPressed: (){},
    //         )
    //
    //
    //       ],
    //     ),
    //   ),
    // );
  }
  // Future signIn() async
  // {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),);
  // }
}


