import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_api/constants/app_theme.dart';
import 'package:rick_and_morty_api/data/repositories/charactor_Repository.dart';
import 'package:rick_and_morty_api/ui/character/controller/characters_controller.dart';
import 'package:rick_and_morty_api/ui/character/screens/character_screen.dart';
import 'package:rick_and_morty_api/core/api/api_client.dart';
import 'package:dio/dio.dart';

void main() {
  Get.lazyPut<Dio>(() => Dio());
  Get.lazyPut<ApiClient>(() => ApiClient(Get.find<Dio>()));
  Get.lazyPut<CharactorRepository>(() => CharactorRepositoryImp(apiClient: Get.find<ApiClient>()));
  Get.lazyPut<CharactersController>(() => CharactersController(Get.find<CharactorRepository>()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const CharacterScreen(),
    );
  }
}
