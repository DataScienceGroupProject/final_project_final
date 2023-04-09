import 'dart:convert';

import 'package:flutter/material.dart';

import 'SpotifyAPI.dart';
// import 'package:audio player/audiophiles.dart';

class SongPlayer extends StatefulWidget {
  final String songUrl;

  SongPlayer({required this.songUrl});

  @override
  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _audioPlayer.play(widget.songUrl);
      setState(() {
        _isPlaying = true;
      });
    }
  }

  // if (userGenres.isEmpty && userArtists.isEmpty) {
  // throw Exception('User preferences not found');
  // }

  // await _refreshAccessToken();
  //
  // final queryParameters = {
  // 'q': userGenres.join('%20OR%20') + '%20' + userArtists.join('%20OR%20'),
  // 'type': 'playlist',
  // };
  //
  // final response = await http.get(
  // Uri.parse('$_baseUrl/search'),
  // headers: {'Authorization': 'Bearer $_accessToken'},
  // queryParameters: queryParameters,
  // );
  //
  // if (response.statusCode == 200) {
  // final data = json.decode(response.body);
  // final playlists = List<SongPlaylist>.from(data['playlists']['items'].map((playlist) => SongPlaylist.fromJson(playlist)));
  // return playlists;
  // } else {
  // throw Exception('Failed to fetch song playlists');
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class AudioPlayer {
  get onDurationChanged => null;

  get onAudioPositionChanged => null;

  void pause() {}

  void play(String songUrl) {}
}





