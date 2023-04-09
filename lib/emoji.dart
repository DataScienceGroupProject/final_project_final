import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ds_group_project/screens/youtube_home.dart';
import 'package:ds_group_project/sidebar.dart';
import 'package:ds_group_project/voice%20recognition.dart';
import 'package:flutter/material.dart';

class EmojiPage extends StatefulWidget {
  static String id = 'emoji_page';
  String output;
  int language;
  int genre;

  EmojiPage(this.language,this.genre,this.output);

  // EmojiPage(this.output);

  @override
  State<EmojiPage> createState() => _EmojiPageState();
}

class _EmojiPageState extends State<EmojiPage> {



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

  String getSentenceForEmotion(String emotion) {
    switch (emotion.toLowerCase()) {
      case 'happy':
        return 'Get ready to groove and '
            'feel the joy, because your personalized '
            'playlist is all set to make you happier '
            'than ever before!';
      case 'sad':
        return 'Sometimes, all we need is a good cry and a playlist'
            ' that understands us. Go ahead and listen'
            ' to your personalized playlist, it\'s okay'
            ' to let it all out';
      case 'surprise':
        return 'Wow, a personalized playlist tailored just for you! What a great surprise. Don\'t wait any longer, hit play and let the good vibes flow.';
      case 'fear':
        return 'Don\'t let fear control you, take a deep breath and listen to your personalized playlist to find comfort and courage.';
      case 'angry':
        return 'It\'s okay to feel angry, we all do sometimes. But instead of holding onto that anger, why not channel it into your personalized playlist and let the music help you release those feelings and find some peace.';
      case 'neutral':
        return 'Take a break from your busy day and let your personalized playlist soothe your soul, helping you to relax and reset.';
      case 'disgust':
        return 'It\'s okay to feel disgusted, but don\'t let it bring you down. Listen to your personalized playlist and let the music lift you up to a better place.';
      default:
        return '';
    }
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
    'Emoji Viewer',
    ),
    ],
    ),
    ),
    body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(getEmojiForEmotion(widget.output),style: TextStyle(fontSize: 100,color: Colors.blueGrey),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30, vertical:10),
                child: TypewriterAnimatedTextKit(
                  text:  [
                    getSentenceForEmotion(widget.output),
                  ],
                  textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontFamily: 'Inder-Regular',
                  ),
                  speed: Duration(milliseconds: 100),
                  pause: Duration(seconds: 60),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:100,vertical:20),
                child: SizedBox(
                  width:double.infinity,
                  child:RawMaterialButton(
                    fillColor:const Color(0xFF5BC0BE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YouTubeHomeScreen(widget.language,widget.genre),
                        ),
                      );
                      // Navigator.pushNamed(context, YouTubeHomeScreen.id);
                    },
                    child:const Text("Play",style:TextStyle(
                      color: Colors.white,
                      fontFamily:'Inder-Regular',
                      fontSize:20,
                    ),),
                  ),
                ),
              ),],
          ),
        ),
    );
  }
}
