import 'package:flutter/material.dart';
import 'package:ds_group_project/screens/video_screen.dart';

import '../models/channel_model.dart';
import '../models/video_model.dart';
import '../services/api_service.dart';
import '../sidebar.dart';

class YouTubeHomeScreen extends StatefulWidget {
  static String id = 'youtube_home';
  int language;
  int genre;
  YouTubeHomeScreen(this.language,this.genre);

  @override
  State<YouTubeHomeScreen> createState() => _YouTubeHomeScreenState();
}

class _YouTubeHomeScreenState extends State<YouTubeHomeScreen> {
  late Channel _channel = Channel(videos: []);
  bool _isLoading = false;
  String playListId = 'PLbvDA_lplQOZoWpni6yXsTRabyg6CqTLc';

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  String getPlayList(){
    if (widget.language == 0 && widget.genre == 0){
      return 'PLbvDA_lplQOZoWpni6yXsTRabyg6CqTLc';
    }
    else if (widget.language == 0 && widget.genre == 1){
      return  'PLXXvmpUox80mR63d7Akx8mp6b8cqzYLYi';
    }
    else if (widget.language == 0 && widget.genre == 2){
      return  'PLXXvmpUox80kLi11XF4dnRvkpDvArHlsm';
    }
    else if (widget.language == 0 && widget.genre == 3){
      return  'PLXXvmpUox80n8mj_PIpIfiR76ZmKrji3l';
    }
    else if (widget.language == 0 && widget.genre == 4){
      return  'PLXXvmpUox80mrfEEEyBsoWdt-0ANOggDt';
    }
    else if (widget.language == 0 && widget.genre == 5){
      return  'PLbvDA_lplQObMOmBiRs43UW3Rv8zgYWhx';
    }
    else if (widget.language == 0 && widget.genre == 6){
      return  'PLXXvmpUox80mWKPU6eI78i5l8p_AzaldR';
    }
    else if (widget.language == 0 && widget.genre == 8){
      return  'PLXXvmpUox80mUaO3JwCeZGQj3FqRDxTgM';
    }
    else if (widget.language == 1 && widget.genre == 0){ //pop
      return  'PLXXvmpUox80mm97D5rl3s4xt7kgSprymQ';
    }
    else if (widget.language == 1 && widget.genre == 1){ // hippop
      return  'PLbvDA_lplQOaFl_eGQ59N2eOmEu9O2Z-z';
    }
    else if (widget.language == 1 && widget.genre == 2){ //rock
      return  'PLbvDA_lplQOZjtroeJhJ37ctlKQIuVdGk';
    }
    // if (widget.language == 1 && widget.genre == 3){ // country
    //   playListId = 'PLXXvmpUox80mUaO3JwCeZGQj3FqRDxTgM';
    // }
    else if (widget.language == 1 && widget.genre == 4){ //elec
      return  'PLXXvmpUox80lKLPTe0_WZPEjwIuiwAB5w';
    }
    // if (widget.language == 1 && widget.genre == 5){ // r&b
    //   playListId = 'PLXXvmpUox80mUaO3JwCeZGQj3FqRDxTgM';
    // }
    else if (widget.language == 1 && widget.genre == 6){ //ins
      return  'PLXXvmpUox80krZPte6cG75PMpevlcTpY8';
    }
    // if (widget.language == 1 && widget.genre == 7){ // workout
    //   playListId = 'PLXXvmpUox80mUaO3JwCeZGQj3FqRDxTgM';
    // }
    else if (widget.language == 1 && widget.genre == 8){ // mood
      return  'PLXXvmpUox80nTbpKB_exBdXoXGC3g829M';
    }


    // if (widget.language == 2 && widget.genre == 0){ // pop
    //   playListId = 'PL5mYvf836WBRuAglMk_ErUOlSXHhbOLeu';
    // }
    else if (widget.language == 2 && widget.genre == 1){ // hip hop
      return  'PL5mYvf836WBRuAglMk_ErUOlSXHhbOLeu';
    }
    else if (widget.language == 2 && widget.genre == 2){ // rock
      return  'PL5mYvf836WBQnZ4UUy-qQl0V5tOd675ib';
    }
    else if (widget.language == 2 && widget.genre == 3){ // country
      return  'PL5mYvf836WBTEgzxExcXy2Ay4sD91biR_';
    }
    // if (widget.language == 2 && widget.genre == 4){ // elec
    //   playListId = 'PLXXvmpUox80nTbpKB_exBdXoXGC3g829M';
    // }
    // if (widget.language == 2 && widget.genre == 5){ // r&b
    //   playListId = 'PLXXvmpUox80nTbpKB_exBdXoXGC3g829M';
    // }
    else if (widget.language == 2 && widget.genre == 6){ // ins
      return  'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    }
    // if (widget.language == 2 && widget.genre == 7){ // work
    //   playListId = 'PLXXvmpUox80nTbpKB_exBdXoXGC3g829M';
    // }
    // if (widget.language == 2 && widget.genre == 8){ // mood
    //   playListId = 'PLXXvmpUox80nTbpKB_exBdXoXGC3g829M';
    // }


    // if (widget.language == 3 && widget.genre == 0){ // pop
    //   playListId = 'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    // }
    else if (widget.language == 3 && widget.genre == 1){ // hip hop
      return  'PL5mYvf836WBTHtlH2iwswwLltwHfWICCz';
    }
    else if (widget.language == 3 && widget.genre == 2){ // rock
      return 'PL5mYvf836WBRHYG1KG-4N5Kwz1Qt_e-MW';
    }
    else if (widget.language == 3 && widget.genre == 3){ // country
      return  'PL5mYvf836WBQS6H2kKG5c1Jfaf2Ef0PsY';
    }
    // if (widget.language == 3 && widget.genre == 4){ // elec
    //   playListId = 'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    // }
    // if (widget.language == 3 && widget.genre == 5){ // r&b
    //   playListId = 'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    // }
    else if (widget.language == 3 && widget.genre == 6){ // ins
      return  'PL5mYvf836WBSMq-1dq_vUJCwco8QqCA0J';
    }
    // if (widget.language == 3 && widget.genre == 7){ // work
    //   playListId = 'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    // }
    // if (widget.language == 3 && widget.genre == 8){ // mood
    //   playListId = 'PL5mYvf836WBSnWVRAlpOMYRPIriBgXAks';
    // }
    else{
      return 'PLbvDA_lplQOZoWpni6yXsTRabyg6CqTLc';
    }
  }

  _initChannel() async {
    Channel channel = await APIService(getPlayList())
        // .fetchChannel(channelId: 'UC6Dy0rQ6zDnQuHQ1EeErGUA');
        .fetchChannel(channelId: 'UCS3p7hqJM0uptAyKv6BhyoQ');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo(){
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl!),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService(getPlayList())
        // .fetchVideosFromPlaylist(
        // playlistId: _channel.uploadPlaylistId);
        .fetchVideosFromPlaylist(playlistId: playListId=getPlayList());
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Music Player',
            ),
          ],
        ),
      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollDetails) {
          if (!_isLoading &&
              _channel.videos.length != int.parse(_channel.videoCount) &&
              scrollDetails.metrics.pixels ==
                  scrollDetails.metrics.maxScrollExtent) {
            _loadMoreVideos();
            print(widget.language);
            print(widget.genre);
          }
          return false;
        },
        child: ListView.builder(
          itemCount: 1 + _channel.videos.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildProfileInfo();
            }
            Video video = _channel.videos[index - 1];
            return _buildVideo(video);
          },
        ),
      )
          : Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor, // Red
          ),
        ),
      ),
    );
  }
}
