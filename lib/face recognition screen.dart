import 'dart:convert';
import 'dart:io';
import 'package:ds_group_project/screens/youtube_home.dart';
import 'package:ds_group_project/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'emoji.dart';

class face_recognition extends StatefulWidget {

  int language;
  int genre;

  face_recognition(this.language,this.genre);

  @override
  State<face_recognition> createState() => _face_recognitionState();
}

class _face_recognitionState extends State<face_recognition> {
  File? selectedImage;
  String? message = "";
  String output = 'No Emotion Detected';

  uploadImage()
  async {
    final request = http.MultipartRequest("POST", Uri.parse("https://9bc6-2402-4000-2280-b66e-fd61-2d8b-58c3-da2d.in.ngrok.io/upload"));

    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image', selectedImage!.readAsBytes().asStream(),selectedImage!.lengthSync(), filename:selectedImage!.path.split("/").last ));

    request.headers.addAll(headers);
    final response =await request.send();
    http.Response res =  await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];
    setState(() {

    });
  }


  Future getImage()
  async {
   final pickedImage = await ImagePicker().getImage(source:ImageSource.gallery);
   setState(() {
     selectedImage = File(pickedImage!.path);
   });
  }

  Future getImageCamera()
  async {
    final pickedImage = await ImagePicker().getImage(source:ImageSource.camera);
    setState(() {
      selectedImage = File(pickedImage!.path);
    });
  }

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
              'Voice Upload',
            ),
          ],
        ),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            selectedImage == null ? const Text("Please pick a image to upload",
            style: TextStyle(color:Colors.white ),):Image.file(selectedImage!),
            const SizedBox(height:15),
            TextButton.icon(
              // onPressed:uploadImage,
              onPressed: (){
                setState(() {
                  output = 'sad';
                });

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => YouTubeHomeScreen(widget.language,widget.genre),
                //   ),
                // );
                // Navigator.pushNamed(context, YouTubeHomeScreen.id);
              },
              icon: const Icon(Icons.upload_file,color:Colors.white,),
              label:const Text("Upload",style:TextStyle(color:Colors.white),),
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF5BC0BE)),

              ),

            ),
            const SizedBox(height:15),
            Center(
              child: Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                  onPressed:getImage,
                  icon: const Icon(Icons.add_a_photo,color:Colors.white,),
                  label:const Text("Gallery",style:TextStyle(color:Colors.white),),
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF5BC0BE)),

                  ),

                ),
                  const SizedBox(width:20,),
                  TextButton.icon(
                    onPressed:getImageCamera,
                    icon: const Icon(Icons.camera,color:Colors.white,),
                    label:const Text("Camera",style:TextStyle(color:Colors.white),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF5BC0BE)),

                    ),

                  ),],
              ),
            ),
            const SizedBox(height:15),
            Text('Detected Mood',style: TextStyle(fontSize: 50,color: Color(0xFF5BC0DE)),
            ),
            Center(
                child: Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(output,style: TextStyle(fontSize: 40,color: Color(0xFF5BC0BE),fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            const SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [TextButton.icon(
                onPressed:() async {
                  if(selectedImage != null){
                    // Navigator.pushNamed(context, EmojiPage.id);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmojiPage(widget.language,widget.genre,'sad'),
                      ),
                    );
                  }

                  setState(() {
                    // output = getEmojiForEmotion(decoded['output']);
                    // output = decoded['output'];
                  });
                  // saveFileToAudioFolder(wavFileName!);
                  // Navigator.pushNamed(context, YouTubeHomeScreen.id);
                },
                icon: const Icon(Icons.navigate_next_rounded,color:Colors.white,),
                label:const Text("Next",style:TextStyle(color:Colors.white),),
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF5BC0BE)),

                ),

              )],
            ),

          ],
        ),
      ),

    );
  }
}


