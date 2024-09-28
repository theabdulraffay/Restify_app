import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api_movie_ui/model/app_config.dart';
import 'package:rest_api_movie_ui/services/http_services.dart';
import 'package:rest_api_movie_ui/services/movie_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onInitializationComplete});
  final VoidCallback onInitializationComplete;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void wait() async {
    await Timer(Duration(seconds: 2), widget.onInitializationComplete);
  }

  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 5),
    // );
    Future.delayed(
      Duration(seconds: 5),
    ).then(
      (_) => setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
    ;
  }

  Future<void> setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );

    getIt.registerSingleton<HttpServices>(
      HttpServices(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicked',
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
