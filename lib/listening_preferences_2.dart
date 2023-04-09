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
class Genre extends StatefulWidget {
  static String id = 'preference_page_2';
  int language;

  Genre(this.language);

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  final List<BoxItem> _boxesGenre = [
    BoxItem(title: "Pop", image: "assets/images/pop.jpg"),
    BoxItem(title: "Hip Hop", image: "assets/images/hip.jpg"),
    BoxItem(title: "Rock", image: "assets/images/rock.jpg"),
    BoxItem(title: "Country", image: "assets/images/country.jpg"),
    BoxItem(title: "Electronic/Dance", image: "assets/images/electronic.jpg"),
    BoxItem(title: "R&B", image: "assets/images/R&B.jpg"),
    BoxItem(title: "Instrumental", image: "assets/images/ins.jpg"),
    BoxItem(title: "Workout", image: "assets/images/workout.jpeg"),
    BoxItem(title: "mood", image: "assets/images/mood.jpeg"),
    BoxItem(title: "Latin", image: "assets/images/latin.jpg"),
  ];
  int _selectedGenreIndex = -1;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Preferred Genre for Listening',
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
                  itemCount: _boxesGenre.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedGenreIndex == index) {
                            // If the user taps the same box twice, unselect it.
                            _selectedGenreIndex = -1;
                            _boxesGenre[index].isSelected = false;
                          } else {
                            // If the user taps a different box, select it and unselect any previously selected box.
                            _selectedGenreIndex = index;
                            for (int i = 0; i < _boxesGenre.length; i++) {
                              if (i == index) {
                                _boxesGenre[i].isSelected = true;
                              } else {
                                _boxesGenre[i].isSelected = false;
                              }
                            }
                            print('selected$_selectedGenreIndex');
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _boxesGenre[index].isSelected ? Colors.deepPurple : Colors.white,
                        ),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Expanded(
                        //       child: Image.asset(
                        //         _boxesGenre[index].image,
                        //         // height: 150,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //     SizedBox(height: 5),
                        //     Text(
                        //       _boxesGenre[index].title,
                        //       style: const TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
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
                                _boxesGenre[index].image,
                                fit: BoxFit.cover,
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: _boxesGenre[index].isSelected ? Colors.deepPurple : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    _boxesGenre[index].title,
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
                if (_selectedGenreIndex!=-1 ){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigation(widget.language,_selectedGenreIndex),
                    ),
                  );

                  // Navigator.pushNamed(context, BottomNavigation.id);
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
