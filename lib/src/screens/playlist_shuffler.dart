import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../secrets.dart';
import '../util/fetch.dart';

const myUserId = '1zy4qczx6za7vjt9lh5cram7u';

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
    actually make a metronome lmao

  */
  String _accessToken = '';

  void _fetchMyPlaylists(token) async {
    final response = await basicFetch(
        url: 'https://api.spotify.com/v1/users/$myUserId/playlists',
        method: 'GET',
        headers: {'Authorization': 'Bearer $token'});

    print(response);
  }

  void _fetchMyProfile(token) async {
    final response = await basicFetch(
        url: 'https://api.spotify.com/v1/users/$myUserId',
        method: 'GET',
        headers: {'Authorization': 'Bearer $token'});

    print(response);
  }

  //1zy4qczx6za7vjt9lh5cram7u

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
            ElevatedButton(
              child: const Text("fetch my profile"),
              onPressed: () async {
                // _fetchMyPlaylists(_accessToken);
                _fetchMyProfile(_accessToken);
              },
            ),
            ElevatedButton(
              child: const Text("fetch my playlists??"),
              onPressed: () async {
                _fetchMyPlaylists(_accessToken);
              },
            ),
          ],
        ),
      ),
    );
  }
}
