import 'package:flutter/material.dart';
import './playlist_shuffler.dart';
import '../settings/settings_view.dart';
import './counter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify Utilities', textAlign: TextAlign.left),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Playlist Shuffler!!'),
                ElevatedButton(
                  child: const Text('Go'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaylistShuffler(key: UniqueKey()),
                        ));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Literally just a counter'),
                ElevatedButton(
                  child: const Text('Go'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Counter(key: UniqueKey()),
                        ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
