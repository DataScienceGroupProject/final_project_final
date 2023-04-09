import 'package:ds_group_project/emoji.dart';
import 'package:ds_group_project/listening_preferences.dart';
import 'package:ds_group_project/listening_preferences_2.dart';
import 'package:ds_group_project/screens/youtube_home.dart';
import 'package:ds_group_project/sign%20in%20page.dart';
import 'package:ds_group_project/welcome%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ds_group_project/splash%20screen.dart';

import 'bottom_navigation.dart';
import 'home_page.dart';
import 'loging_screen.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}
class Myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute: Splash.id,
      routes: {
        Splash.id: (context) => Splash(),
        HomeScreen.id: (context) => HomeScreen(),
        HomeScreen2.id: (context) => HomeScreen2(-1,-1),
        SignInPage.id: (context) => SignInPage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ListeningPreference.id: (context) => ListeningPreference(),
        BottomNavigation.id: (context) => BottomNavigation(-1,-1),
        Genre.id: (context) => Genre(-1),
        YouTubeHomeScreen.id: (context) => YouTubeHomeScreen(-1,-1),
        EmojiPage.id: (context) => EmojiPage(-1,-1,'sad'),
      },
    );
  }
}

