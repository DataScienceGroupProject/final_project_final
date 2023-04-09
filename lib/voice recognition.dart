import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
// import 'package:ds_group_project/screens/youtube_home.dart';
import 'package:ds_group_project/emoji.dart';
import 'package:ds_group_project/sidebar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'function.dart';
// import 'package:path_provider/path_provider.dart';

class voice_recognition extends StatefulWidget {
  int language;
  int genre;

  voice_recognition(this.language,this.genre);


  @override
  State<voice_recognition> createState() => _voice_recognitionState();
}

class _voice_recognitionState extends State<voice_recognition> {
  File? selectedFile;
  String? message = "";
  String? wavFileName;

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  String url = '';
  var data;
  String output = 'No emotion detected';



  // Map each emotion to its corresponding emoji
  String getEmojiForEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'surprise':
        return '😮';
      case 'fear':
        return '😨';
      case 'angry':
        return '😠';
      case 'neutral':
        return '😐';
      case 'disgust':
        return '🤢';
      default:
        return '';
    }
  }


  pickFile() async
  {
    setState(() {
      isLoading = true;
    });
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav'],
      allowMultiple: false,
    );
    fileToDisplay =File(result!.files.single.path!);

    if(result!= null){
      pickedfile = result!.files.first;
      wavFileName = pickedfile!.name;
      print('Selected WAV file: $wavFileName');
    }


    setState(() {
      isLoading = false;
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
            const SizedBox(height:35),
            wavFileName != null
                ? Text(
              'Selected WAV file: $wavFileName',
              style: TextStyle(fontSize: 18,color: Colors.blueGrey),
            )
                : Text(
              'Please select a WAV file',
              style: TextStyle(fontSize: 18,color: Colors.red),
            ),
            const SizedBox(height:15),
            TextButton.icon(
              onPressed:() async {
                url = 'http://10.0.2.2:5000/api?query=' + wavFileName.toString();
                data = await fetchdata(url);
                var decoded = jsonDecode(data);
                setState(() {
                  output = decoded['output'];
                  // output = getEmojiForEmotion(decoded['output']);
                  // output = decoded['output'];
                });
                // saveFileToAudioFolder(wavFileName!);
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
                    onPressed:pickFile,
                    icon: const Icon(Icons.file_copy,color:Colors.white,),
                    label:const Text("Device",style:TextStyle(color:Colors.white),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF5BC0BE)),

                    ),

                  ),

                ],
              ),

            ),
            const SizedBox(height:15),
            // Center(
            //     child: Row(
            //       crossAxisAlignment:CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(output,style: TextStyle(fontSize: 40,color: Color(0xFF5BC0BE)),
            //         )],
            //     )),
            const SizedBox(height:15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [TextButton.icon(
                onPressed:() async {
                  if(wavFileName != null){
                    // Navigator.pushNamed(context, EmojiPage.id);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmojiPage(widget.language,widget.genre,output),
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


