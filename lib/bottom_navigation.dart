import 'package:ds_group_project/listening_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ds_group_project/user_preference_page.dart';

import 'chatbox_page.dart';
import 'home_page.dart';


 class BottomNavigation extends StatefulWidget {
   static String id = 'bottom_navigator';
   int language;
   int genre;

   BottomNavigation(this.language,this.genre);

   @override
   State<BottomNavigation> createState() => _BottomNavigationState();
 }

 class _BottomNavigationState extends State<BottomNavigation>
 {
   int currentIndex = 0;
   // final List<Widget> children = [
   //   HomeScreen2(widget.language,widget.genre),
   //   chat_bot_page(),
   //   ListeningPreference(),
   //
   // ];
   void onTappedBar(int index)
   {
    setState(() {
      currentIndex = index;
    });
   }

   @override
   Widget build(BuildContext context) {
     final List<Widget> children = [
       HomeScreen2(widget.language,widget.genre),
       chat_bot_page(),
       ListeningPreference(),

     ];
     return Scaffold(
       body:children[currentIndex] ,
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: const Color(0xFF0B132B),
         onTap: onTappedBar,
         currentIndex: currentIndex,
         items:const  [
           BottomNavigationBarItem(
                label: " ",
               icon: Icon(Icons.home,
                   color:Colors.white,
                 size:35,
               ),
            ),
           BottomNavigationBarItem(
             label: " ",
             icon: Icon(Icons.message,
               color:Colors.white,
               size:35,
             ),
           ),
           BottomNavigationBarItem(
             label: " ",
             icon: Icon(Icons.account_box,
               color:Colors.white,
               size:35,
             ),
           ),

         ],
       ),
     );
   }
 }
