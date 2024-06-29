import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../secrets.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Fetch playlists'),
            ElevatedButton(
              child: Text("do thing"),
              onPressed: () async {
                print('pressed');
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
                  print('Access Token: ${data['access_token']}');
                } else {
                  print('Failed to obtain token: ${response.statusCode}');
                  print('Response: ${response.body}');
                }
              },
            ),
            Text('show the playlists?'),
          ],
        ),
      ),
    );
  }
}
