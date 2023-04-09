import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class SongPlaylist {
  final String name;
  final String id;

  SongPlaylist({
    required this.name,
    required this.id,
  });

  factory SongPlaylist.fromJson(Map<String, dynamic> json) {
    return SongPlaylist(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class SpotifyAPI {
  static const String _baseUrl = 'https://api.spotify.com/v1';
  static const String _clientId = 'YOUR_CLIENT_ID';
  static const String _clientSecret = 'YOUR_CLIENT_SECRET';

  late String _accessToken;

  Future<void> _refreshAccessToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ${base64.encode(utf8.encode("$_clientId:$_clientSecret"))}',
      },
      body: 'grant_type=client_credentials',
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _accessToken = data['access_token'] ?? '';
    } else {
      throw Exception('Failed to refresh access token');
    }
  }

  Future<List<SongPlaylist>> getSongPlaylists() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final firestore = FirebaseFirestore.instance;

    if (firebaseUser == null) {
      throw Exception('User not authenticated');
    }

    final userData = await firestore.collection('users')
        .doc(firebaseUser.uid)
        .get();
    final userGenres = List<String>.from(userData['genres'] ?? []);
    final userArtists = List<String>.from(userData['artists'] ?? []);

    if (userGenres.isEmpty && userArtists.isEmpty) {
      throw Exception('User preferences not found');
    }

    await _refreshAccessToken();

    final queryParameters = {
      'q': userGenres.join('%20OR%20') + '%20' + userArtists.join('%20OR%20'),
      'type': 'playlist',
    };

    final response = await http.get(
      Uri.parse('$_baseUrl/search'),
      headers: {'Authorization': 'Bearer $_accessToken'},
      // queryParameters: queryParameters,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final playlists = List<SongPlaylist>.from(
          data['playlists']['items'].map((playlist) =>
              SongPlaylist.fromJson(playlist)));
      return playlists;
    } else {
      throw Exception('Failed to fetch song playlists');
    }
  }}
