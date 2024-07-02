import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../secrets.dart';

/*
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Album album =
          Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      print(album.userId);
      print(album.id);
      print(album.title);
      return album;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  */
class PlaylistShuffler extends StatefulWidget {
  const PlaylistShuffler({super.key});

  @override
  _PlaylistShuffler createState() => _PlaylistShuffler();
}

class _PlaylistShuffler extends State<PlaylistShuffler> {
  /*
    TODOS

    get list of songs in playlist

    randomise order

    create new playlist

    push to new playlist

    extension tasks
    actually make a metronome lmao'

  */
  String _accessToken = '';

  void _fetchAccessToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': client_id,
        'client_secret': client_secret,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _setAccessToken(data['access_token']);
    } else {
      print('error');
    }
  }

  void _setAccessToken(token) {
    setState(() {
      _accessToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist Shuffler'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Fetch playlists'),
            ElevatedButton(
              child: const Text("get access token"),
              onPressed: () {
                print('fetching access token...');
                _fetchAccessToken();
              },
            ),
            ElevatedButton(
              child: const Text("print access token"),
              onPressed: () async {
                print(_accessToken);
              },
            ),
            const Text('show the playlists?'),
          ],
        ),
      ),
    );
  }
}
