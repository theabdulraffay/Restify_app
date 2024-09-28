import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_movie_ui/Pages/main_page.dart';
import 'package:rest_api_movie_ui/Pages/splash_screen.dart';

void main() {
  runApp(
    SplashScreen(
      onInitializationComplete: () => runApp(ProviderScope(child: MyApp(),),),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicker',
      initialRoute: 'home',
      routes: {
        'home': (context) => MainPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
