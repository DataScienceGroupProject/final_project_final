import 'package:ds_group_project/listening_preferences.dart';
import 'package:ds_group_project/splash%20screen.dart';
import 'package:ds_group_project/welcome%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ds_group_project/loging_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'design.dart';

class SignInPage extends StatefulWidget {
  static String id = 'sign_in_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool isBackLoading = false;
  late String email;
  late String password;
  late String reEnteredPassword = ' ';
  bool passwordsMatch = true;
  // late FormFieldValidator<String>?validator;
  // late TextEditingController controller;
  // final  formKey = GlobalKey<FormState>();

  void checkPasswords() {
    if (password != null && reEnteredPassword != null) {
      setState(() {
        passwordsMatch = password == reEnteredPassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
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
                  height: 200.0,
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
                // validator: (value){
                //   if (value!=null && value.isNotEmpty && value.length < 5){
                //     return validator!('Please enter a valid email');
                //     // return 'Your username should be more than 5 characters';
                //   }else if(value!=null && value.isEmpty){
                //     return validator!('Please type your email');
                //     // return 'Please type your username';
                //   }
                //   return null;
                // },
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:KTextFieldDecoration.copyWith(hintText: 'Enter your Email')
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
                  checkPasswords();
                },
                decoration:KTextFieldDecoration.copyWith(hintText: 'Enter your password')
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
                  reEnteredPassword = value;
                  checkPasswords();
                },
                decoration:KTextFieldDecoration.copyWith(hintText: 'Re-enter your password',
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: passwordsMatch? Color(0xFF5BC0BE) : Colors.red, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: passwordsMatch? Color(0xFF5BC0BE) : Colors.red, width: 4.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),),
            ),
            SizedBox(
              height: 24.0,
            ),
            // RoundedButton(title: 'Register',
            // color: Colors.blueAccent,
            // onPressed: () async {
            //   // print(email);
            //   // print(password);
            //
            //   try {
            //     final newUser = await _auth.createUserWithEmailAndPassword(
            //         email: email, password: password);
            //     if (newUser != null) {
            //       Navigator.pushNamed(context, ChatScreen.id);
            //     }
            //
            //   }
            //   catch (e) {
            //     print(e);
            //   }
            // },)
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
                    : Text('Register'),

                onPressed: () async {
                  // print(email);
                  // print(password);
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    if (password == reEnteredPassword){
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      // else{}
                    }}

                    // else{}
                    setState(() {
                      isLoading = false;
                    });

                  }
                  catch (e) {
                    print(e);
                  }

                },),


            ),
            SizedBox(
              height: 8.0,
            ),
      Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // textStyle: TextStyle(fontSize: 24),
            // minimumSize: Size.fromHeight(72),
            shape: StadiumBorder(),
            backgroundColor: Color(0xFF3A506B),
          ),
          child: isBackLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text('Back'),

          onPressed: () async {
            setState(() {
              isBackLoading = true;
            });
                Navigator.pushNamed(context, Splash.id);
          },),)
          ],
        ),
      ),
      // body:Center(
      //   child:Column(
      //     children: [
      //       Image.asset('assets/images/dsgp_logo_3.png',height:200,width:200,),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(0,0, 270, 0),
      //         child: Text("First name",textAlign:TextAlign.end ,style:TextStyle(
      //           color: Colors.white,
      //           fontFamily:'Inder-Regular',
      //           fontSize:15,
      //         ),),
      //       ),
      //       const SizedBox(height:8,),
      //       Padding(
      //           padding:const EdgeInsets.symmetric(horizontal:10),
      //           child:Container(
      //             decoration:BoxDecoration(
      //               color:const Color(0xFF5D6978),
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             child:const Padding(
      //               padding: EdgeInsets.symmetric(horizontal:10),
      //               child: TextField(
      //                 style:TextStyle(color:Color(0xFFFFFFFF)),
      //                 decoration: InputDecoration(
      //                     border:InputBorder.none,
      //                     hintText:"Enter your first name here",
      //                     hintStyle:TextStyle(
      //                         color:Color(0xFFFFFFFF),
      //                         fontFamily:'Inder-Regular')
      //                 ),
      //               ),
      //             ),
      //           ),),
      //       const SizedBox(height:10,),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(0,0, 270, 0),
      //         child: Text("Last name",textAlign:TextAlign.end ,style:TextStyle(
      //           color: Colors.white,
      //           fontFamily:'Inder-Regular',
      //           fontSize:15,
      //         ),),
      //       ),
      //       const SizedBox(height:8,),
      //       Padding(
      //         padding:const EdgeInsets.symmetric(horizontal:10),
      //         child:Container(
      //           decoration:BoxDecoration(
      //             color:const Color(0xFF5D6978),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child:const Padding(
      //             padding: EdgeInsets.symmetric(horizontal:10),
      //             child: TextField(
      //               style:TextStyle(color:Color(0xFFFFFFFF)),
      //               decoration: InputDecoration(
      //                   border:InputBorder.none,
      //                   hintText:"Enter your last name here",
      //                   hintStyle:TextStyle(
      //                       color:Color(0xFFFFFFFF),
      //                       fontFamily:'Inder-Regular')
      //               ),
      //             ),
      //           ),
      //         ),),
      //       const SizedBox(height:10,),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(0,0, 310, 0),
      //         child: Text("Email",textAlign:TextAlign.end ,style:TextStyle(
      //           color: Colors.white,
      //           fontFamily:'Inder-Regular',
      //           fontSize:15,
      //         ),),
      //       ),
      //       const SizedBox(height:8,),
      //       Padding(
      //         padding:const EdgeInsets.symmetric(horizontal:10),
      //         child:Container(
      //           decoration:BoxDecoration(
      //             color:const Color(0xFF5D6978),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child:const Padding(
      //             padding: EdgeInsets.symmetric(horizontal:10),
      //             child: TextField(
      //               style:TextStyle(color:Color(0xFFFFFFFF)),
      //               decoration: InputDecoration(
      //                   border:InputBorder.none,
      //                   hintText:"Enter your Email here",
      //                   hintStyle:TextStyle(
      //                       color:Color(0xFFFFFFFF),
      //                       fontFamily:'Inder-Regular')
      //               ),
      //             ),
      //           ),
      //         ),),
      //       const SizedBox(height:10,),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(0,0, 280, 0),
      //         child: Text("Password",textAlign:TextAlign.end ,style:TextStyle(
      //           color: Colors.white,
      //           fontFamily:'Inder-Regular',
      //           fontSize:15,
      //         ),),
      //       ),
      //       const SizedBox(height:8,),
      //       Padding(
      //         padding:const EdgeInsets.symmetric(horizontal:10),
      //         child:Container(
      //           decoration:BoxDecoration(
      //             color:const Color(0xFF5D6978),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child:const Padding(
      //             padding: EdgeInsets.symmetric(horizontal:10),
      //             child: TextField(
      //               style:TextStyle(color:Color(0xFFFFFFFF)),
      //               decoration: InputDecoration(
      //                   border:InputBorder.none,
      //                   hintText:"Enter your password here",
      //                   hintStyle:TextStyle(
      //                       color:Color(0xFFFFFFFF),
      //                       fontFamily:'Inder-Regular')
      //               ),
      //             ),
      //           ),
      //         ),),
      //       const SizedBox(height:10,),
      //       const Padding(
      //         padding: EdgeInsets.fromLTRB(0,0, 240, 0),
      //         child: Text("Retype password",textAlign:TextAlign.end ,style:TextStyle(
      //           color: Colors.white,
      //           fontFamily:'Inder-Regular',
      //           fontSize:15,
      //         ),),
      //       ),
      //       const SizedBox(height:8,),
      //       Padding(
      //         padding:const EdgeInsets.symmetric(horizontal:10),
      //         child:Container(
      //           decoration:BoxDecoration(
      //             color:const Color(0xFF5D6978),
      //             borderRadius: BorderRadius.circular(12),
      //           ),
      //           child:const Padding(
      //             padding: EdgeInsets.symmetric(horizontal:10),
      //             child: TextField(
      //               style:TextStyle(color:Color(0xFFFFFFFF)),
      //               decoration: InputDecoration(
      //                   border:InputBorder.none,
      //                   hintText:"Retype the password here",
      //                   hintStyle:TextStyle(
      //                       color:Color(0xFFFFFFFF),
      //                       fontFamily:'Inder-Regular')
      //               ),
      //             ),
      //           ),
      //         ),),
      //       const SizedBox(height:10,),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal:120),
      //         child: SizedBox(
      //           width:double.infinity,
      //           child:RawMaterialButton(
      //             fillColor:const Color(0xFF5BC0BE),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(15)
      //             ),
      //             onPressed: () {},
      //             child:const Text("Sign in",style:TextStyle(
      //                 fontFamily:'Inder-Regular',
      //                 fontSize:20,
      //                 color:Color(0xFFFFFFFF)
      //             ),),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal:120),
      //         child: SizedBox(
      //           width:double.infinity,
      //           child:RawMaterialButton(
      //             fillColor:const Color(0xFF3A506B),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(15)
      //             ),
      //             onPressed: () {
      //               Navigator.of(context).push(MaterialPageRoute(builder:(_){
      //                 return HomeScreen();
      //               }));
      //             },
      //             child:const Text("Back",style:TextStyle(
      //                 fontFamily:'Inder-Regular',
      //                 fontSize:20,
      //                 color:Color(0xFFFFFFFF)
      //             ),),
      //           ),
      //         ),
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
    );
  }
}
