import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter-toast/fluttertoast.dart';

class YoutubeAudioDownloader extends StatefulWidget {
  @override
  _YoutubeAudioDownloaderState createState() => _YoutubeAudioDownloaderState();
}

class _YoutubeAudioDownloaderState extends State<YoutubeAudioDownloader> {
  TextEditingController _controller = TextEditingController();
  String _videoId = '';
  String _downloadUrl = '';
  bool _isDownloading = false;
  bool _isDownloaded = false;
  String _downloadProgress = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getVideoId(String query) async {
    String url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=YOUR_API_KEY';
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      if (data['items'] != null && data['items'].length > 0) {
        _videoId = data['items'][0]['id']['videoId'];
        setState(() {});
        _getDownloadUrl();
      } else {
        Fluttertoast.showToast(msg: 'No video found with this query');
      }
    } catch (error) {
      Fluttertoast.showToast(msg: 'Error getting video Id');
    }
  }

  Future<void> _getDownloadUrl() async {
    if (_videoId == '') {
      Fluttertoast.showToast(msg: 'Please enter a query first');
      return;
    }
    String url = 'https://www.youtube.com/watch?v=$_videoId';
    try {
      final response = await http.get(Uri.parse(url));
      final data = response.body;
      RegExp regExp = RegExp(r'"url":"(.+m4a)"');
      _downloadUrl = regExp.firstMatch(data)?.group(1) ?? '';
      if (_downloadUrl != '') {
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: 'Error getting download URL');
      }
    } catch (error) {
      Fluttertoast.showToast(msg: 'Error getting download URL');
    }
  }

  Future<void> _downloadAudio() async {
    if (_downloadUrl == '') {
      Fluttertoast.showToast(msg: 'Please get download URL first');
      return;
    }

    setState(() {
      _isDownloading = true;
      _isDownloaded = false;
      _downloadProgress = '0%';
    });

    final dir = await getExternalStorageDirectory();
    final downloadPath = '${dir?.path}/audio.mp4';

    try {
      final client = http.Client();
      final req = http.Request('GET', Uri.parse(_downloadUrl));
      final res = client.send(req);

      final file = File(downloadPath);
      final raf = file.openSync(mode: FileMode.write);

      int total = 0;
      res.asStream().listen((http.StreamedResponse r) {
        r.stream.listen((List<int> chunk) {
          total += chunk.length;
          final progress = ((total / 300) * 100).toInt();
          setState(() {
            _downloadProgress = '$progress%';
          });
          raf.writeFromSync(chunk);
        }, onDone: () {
          raf.close();
          setState(() {
            _isDownloading = false;
            _isDownloaded = true;
          });
          Fluttertoast.showToast(msg: 'Audio downloaded successfully');
        }, onError: (error) {
          raf.close();
          setState(() {
            _isDownloading = false;
            _isDownloaded = false;
          });
          Fluttertoast.showToast(msg: 'Error downloading audio');
        });
      });
    } catch (error) {
      setState(() {
        _isDownloading = false;
        _isDownloaded = false;
      });
      Fluttertoast.showToast(msg: 'Error downloading audio');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Fluttertoast {
  static void showToast({required String msg}) {}
}


