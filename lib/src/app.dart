import 'package:flutter/material.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'screens/home_view.dart';
import 'screens/playlist_shuffler.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          initialRoute: '/',
          routes: {
            '/': (context) => const HomeView(),
            '/playlistShuffler': (context) => const PlaylistShuffler(),
            '/settings': (context) =>
                SettingsView(controller: settingsController),
          },

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          // onGenerateRoute: (RouteSettings routeSettings) {
          //   return MaterialPageRoute<void>(
          //     settings: routeSettings,
          //     builder: (BuildContext context) {
          //       print(routeSettings.name);
          //       switch (routeSettings.name) {
          //         case SettingsView.routeName: //views can
          //           return SettingsView(controller: settingsController);
          //         default:
          //           // return const SampleItemListView();
          //           return const HomeView();
          //       }
          //     },
          //   );
          // },
        );
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
// routes: {
//   '/': (context) => HomeScreen(),
//   '/details': (context) => DetailScreen(),
// },
//   );
// }
