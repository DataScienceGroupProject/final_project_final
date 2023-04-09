import 'package:flutter/material.dart';
import 'package:ds_group_project/sidebar.dart';

class user_preference extends StatefulWidget {
  const user_preference({Key? key}) : super(key: key);

  @override
  State<user_preference> createState() => _user_preferenceState();
}

class _user_preferenceState extends State<user_preference> {

  String valueChoose1 ='Select language';
  String valueChoose2 ='Select genre';
  String valueChoose3='Select Artist';
  List<String> listItem1 = [
    "Select language","Sinhala","English","Hindi","Spanish"
  ];

  List<String> listItem2 = [
    "Select genre","Rock","Hip hop","Electronic music","Pop"
  ];

  List<String> listItem3 = [
    "Select Artist","The Weekend","Ariana Grande","Justin Bieber","Katy Perry"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF0B132B),
      body:Column(
        children: [
          const SizedBox(height:250,),
          Container(
            margin:const EdgeInsets.symmetric(vertical:20),
            padding: const EdgeInsets.symmetric(horizontal:50),
            child:const Text("Here you can select you listening preference as you desire",
                style:TextStyle(
                  color:Colors.white,
                  fontSize:25,
                  fontFamily:'Inder-Regular',
                )),
          ),
          Center(
            child: Container(
              margin:const EdgeInsets.symmetric(vertical:20),
              padding: const EdgeInsets.symmetric(horizontal:30),
              decoration: const ShapeDecoration(
                color: Color(0xFF5BC0BE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              child: DropdownButton(
                items:listItem1.map((String valueItem){
                  return DropdownMenuItem<String>(
                    value: valueItem,
                    child:Text(valueItem),
                  );
                }).toList(),
                value:valueChoose1,
                style: const TextStyle(
                  color:Color(0xFF5D6978),
                  fontSize:25,
                  fontFamily:'Inder-Regular',
                  // fontWeight: FontWeight.bold,
                ),
                onChanged: (newValue)
                {
                    setState(() {
                      valueChoose1 = newValue as String;
                    });
                },
              ),
            ),
          ),
          Center(
            child: Container(
              margin:const EdgeInsets.symmetric(vertical:20),
              padding: const EdgeInsets.symmetric(horizontal:30),
              decoration: const ShapeDecoration(
                color: Color(0xFF5BC0BE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              child: DropdownButton(
                items:listItem2.map((String valueItem){
                  return DropdownMenuItem<String>(
                    value: valueItem,
                    child:Text(valueItem),
                  );
                }).toList(),
                value:valueChoose2,
                style: const TextStyle(
                  color:Color(0xFF5D6978),
                  fontSize:25,
                  fontFamily:'Inder-Regular',
                  // fontWeight: FontWeight.bold,
                ),
                onChanged: (newValue)
                {
                  setState(() {
                    valueChoose2 = newValue as String;
                  });
                },
              ),
            ),
          ),
          Center(
            child: Container(
              margin:const EdgeInsets.symmetric(vertical:20),
              padding: const EdgeInsets.symmetric(horizontal:40),
              decoration: const ShapeDecoration(
                color: Color(0xFF5BC0BE),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              child: DropdownButton(
                items:listItem3.map((String valueItem){
                  return DropdownMenuItem<String>(
                    value: valueItem,
                    child:Text(valueItem),
                  );
                }).toList(),
                value:valueChoose3,
                style: const TextStyle(
                  color:Color(0xFF5D6978),
                  fontSize:25,
                  fontFamily:'Inder-Regular',
                  // fontWeight: FontWeight.bold,
                ),
                onChanged: (newValue)
                {
                  setState(() {
                    valueChoose3 = newValue as String;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
