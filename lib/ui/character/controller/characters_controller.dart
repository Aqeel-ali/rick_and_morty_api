import 'package:get/get.dart';
import 'package:rick_and_morty_api/data/model/charactor_model.dart';
import 'package:rick_and_morty_api/data/repositories/charactor_Repository.dart';

class CharactersController extends GetxController {
  final CharactorRepository charactersRepository;
  final RxList<CharacterModel> characters = <CharacterModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool hasReachedMax = false.obs;
  int _pageNumber = 1;

  CharactersController(this.charactersRepository);

  @override
  void onInit() {
    super.onInit();
    fetchInitialCharacters();
  }

  Future<void> fetchInitialCharacters() async {
    if (isLoading.value) return;

    isLoading.value = true;
    errorMessage.value = '';
    _pageNumber = 1;
    try {
      final response = await charactersRepository.getAllcharacters(
        _pageNumber,
      );
      final List<CharacterModel> newCharacters = response['characters'];
      final Map<String, dynamic> info = response['info'];

      characters.assignAll(newCharacters);
      hasReachedMax.value = info['next'] == null;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchMoreCharacters() async {
    if (isLoading.value || hasReachedMax.value) return;

    isLoading.value = true;
    errorMessage.value = '';
    try {
      _pageNumber++;
      final response = await charactersRepository.getAllcharacters(
        _pageNumber,
      );
      final List<CharacterModel> newCharacters = response['characters'];
      final Map<String, dynamic> info = response['info'];

      if (newCharacters.isEmpty || info['next'] == null) {
        hasReachedMax.value = true;
      } else {
        characters.addAll(newCharacters);
      }
    } catch (e) {
      print("Failed to fetch more characters: $e");
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
