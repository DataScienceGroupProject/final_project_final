// import 'package:flutter_youtube_api/models/video_model.dart';
import 'package:ds_group_project/models/video_model.dart';

class Channel {

  final String id;
  final String title;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;
  final String uploadPlaylistId;
  List<Video> videos;

  Channel({
    this.id = '',
    this.title = '',
    this.profilePictureUrl = '',
    this.subscriberCount ='',
    this.videoCount ='',
    this.uploadPlaylistId='',
    required this.videos,
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      title: map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
      videos: [],
    );
  }

}