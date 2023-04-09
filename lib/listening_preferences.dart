import 'package:ds_group_project/listening_preferences_2.dart';
import 'package:ds_group_project/loging_screen.dart';
import 'package:ds_group_project/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';


class BoxItem {
  final String title;
  final String image;
  bool isSelected;

  BoxItem({required this.title, required this.image, this.isSelected = false});
}
class ListeningPreference extends StatefulWidget {
  static String id = 'preference_page';


  @override
  State<ListeningPreference> createState() => _ListeningPreferenceState();
}

class _ListeningPreferenceState extends State<ListeningPreference> {
  final List<BoxItem> _boxes = [
    BoxItem(title: "English", image: "assets/images/language.jpg"),
    BoxItem(title: "Sinhala", image: "assets/images/sinhala.jpg"),
    BoxItem(title: "Tamil", image: "assets/images/tamil.jpg"),
    BoxItem(title: "Hindi", image: "assets/images/hindi.jpg"),
    BoxItem(title: "Korean", image: "assets/images/korean.jpg"),
    BoxItem(title: "French", image: "assets/images/french.jpg"),
  ];


  int _selectedIndex = -1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xFF0B132B),
    drawer:const sideBar(),
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
            'Listening Preferences',
          ),
        ],
      ),
    ),
      body:
          // const Text('Preferred language'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Preferred Language for Listening',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.purple.shade600),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: GridView.builder(
    itemCount: _boxes.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    ),
    itemBuilder: (BuildContext context, int index) {
    return GestureDetector(
    onTap: () {
    setState(() {
    if (_selectedIndex == index) {
    // If the user taps the same box twice, unselect it.
    _selectedIndex = -1;
    _boxes[index].isSelected = false;
    } else {
    // If the user taps a different box, select it and unselect any previously selected box.
    _selectedIndex = index;
    for (int i = 0; i < _boxes.length; i++) {
    if (i == index) {
    _boxes[i].isSelected = true;
    } else {
    _boxes[i].isSelected = false;
    }
    }
    print('selected$_selectedIndex');
    }
    });
    },
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: _boxes[index].isSelected ? Colors.deepPurple : Colors.white,
    ),


    // child: Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: [
    // Expanded(
    //   child: Image.asset(
    //   _boxes[index].image,
    //   // height: 150,
    //     fit: BoxFit.cover,
    //   ),
    // ),
    // SizedBox(height: 5),
    // Text(
    // _boxes[index].title,
    // style: const TextStyle(
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    // ],
    // ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: _boxesGenre[index].isSelected ? Colors.deepPurple : Colors.white,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              _boxes[index].image,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: _boxes[index].isSelected ? Colors.deepPurple : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _boxes[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    ),
    );
    },
    ),
                  ),
                ),
              ),

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
        : Text('Next'),

    onPressed: () async {
    // print(email);
    // print(password);
    setState(() {
    isLoading = true;
    });
    if (_selectedIndex != -1 ){

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Genre(_selectedIndex),
        ),
      );
    // Navigator.pushNamed(context, Genre.id);
    }

    setState(() {
    isLoading = false;
    });



    },),),
            ],
          ),

      );
  }
}

