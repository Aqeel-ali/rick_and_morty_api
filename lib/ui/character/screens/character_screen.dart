import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_api/ui/character/controller/characters_controller.dart';
import 'package:rick_and_morty_api/ui/character/widget/char_card.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final CharactersController controller = Get.find<CharactersController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      controller.fetchMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Characters")),
      body: Obx(() {
        if (controller.isLoading.value && controller.characters.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: controller.hasReachedMax.value
                ? controller.characters.length
                : controller.characters.length + 1,
            itemBuilder: (context, index) {
              if (index >= controller.characters.length) {
                return const Center(child: CircularProgressIndicator());
              }
              return CharacterCard(character: controller.characters[index]);
            },
          );
        }
      }),
    );
  }
}
