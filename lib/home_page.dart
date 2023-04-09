import 'package:flutter/material.dart';
import 'package:ds_group_project/sidebar.dart';
import 'package:ds_group_project/voice%20recognition.dart';
import 'face recognition screen.dart';


class HomeScreen2 extends StatefulWidget {
  static String id = 'home_screen_1';
  int language;
  int genre;

  HomeScreen2(this.language,this.genre);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  int currentIndex = 0;

  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0B132B),
      drawer:sideBar(),
      appBar:AppBar(
        backgroundColor: const Color(0xFF0B132B),
        title: Row(
          children: [
            Image.asset(
              'assets/images/eMution.png',
              height: 30,
            ),
            const SizedBox(width: 10),
            const Text(
              'Mood Detection',
            ),
          ],
        ),
      ),
      body:Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal:15),
          //   child: Container(
          //     height:220,
          //     width: double.infinity,
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(image:AssetImage('assets/images/face.png',))
          //     ),
          //     child: Container(
          //       alignment: Alignment.bottomLeft,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal:90,vertical:80),
          //         child: SizedBox(
          //           width:double.infinity,
          //           child:RawMaterialButton(
          //             fillColor:const Color(0xFFffffff),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(15)
          //             ),
          //             onPressed: () {
          //               Navigator.of(context).push(MaterialPageRoute(builder:(_)
          //               {
          //                 return const face_recognition();
          //               }));
          //             },
          //             child:const Text("Face recognition",style:TextStyle(
          //               fontFamily:'Inder-Regular',
          //               fontSize:20,
          //             ),),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(_)
                {
                  return face_recognition(widget.language,widget.genre);
                }));
              },
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/face.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Face recognition",
                      style: TextStyle(
                        fontFamily: 'Inder-Regular',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal:15),
          //   child: Container(
          //     height:220,
          //     width: double.infinity,
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(image:AssetImage('assets/images/voice2.jpg',))
          //     ),
          //     child:Container(
          //       alignment: Alignment.bottomLeft,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal:90,vertical:80),
          //         child: SizedBox(
          //           width:double.infinity,
          //           child:RawMaterialButton(
          //             fillColor:const Color(0xFFffffff),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(15)
          //             ),
          //             onPressed: () {
          //               Navigator.of(context).push(MaterialPageRoute(builder:(_)
          //               {
          //                 return const voice_recognition();
          //               }));
          //             },
          //             child:const Text("Voice recognition",style:TextStyle(
          //               fontFamily:'Inder-Regular',
          //               fontSize:20,
          //             ),),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
            onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(_)
            {
            return  voice_recognition(widget.language,widget.genre);
            }));
            },
            child: Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/voice2.jpg'),
            fit: BoxFit.cover,
            ),
            ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
            child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
            "Voice recognition",
    style: TextStyle(
    fontFamily: 'Inder-Regular',
    fontSize: 20,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
    ),
          )


    ],
      ) ,


    );
  }
}
