import 'package:flutter/material.dart';

import 'loging_screen.dart';

class sideBar extends StatefulWidget {
  const sideBar({Key? key}) : super(key: key);

  @override
  State<sideBar> createState() => _sideBarState();
}

class _sideBarState extends State<sideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:const Color(0xFF0B132B),
      child:Column(
        children: [
          Container(
            width:double.infinity,
            padding: const EdgeInsets.all(20),
            color:const Color(0xFF0B132B),
            child:Center(
              child: Column(
                children: [
                  Container(
                    width : 100,
                    height: 100,
                    margin: const EdgeInsets.only(top:30, bottom:15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image:AssetImage('assets/images/user.png',),
                      fit:BoxFit.fill)
                    ),
                  ),
                  const Text("Admin",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  ),),
                  const Text("Admin@iit.ac.lk",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    ),)
                ],
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical:10),
            child: SizedBox(
              width:double.infinity,
              child:RawMaterialButton(
                fillColor:const Color(0xFF3A506B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(_){
                    return HomeScreen();
                  }));
                },
                child:const Text("Log out",style:TextStyle(
                    fontFamily:'Inder-Regular',
                    fontSize:20,
                    color:Color(0xFFFFFFFF)
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
