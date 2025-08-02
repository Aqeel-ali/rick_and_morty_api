import 'package:flutter/foundation.dart';
import 'package:rick_and_morty_api/core/api/api_client.dart';
import 'package:rick_and_morty_api/data/model/charactor_model.dart';

abstract class CharactorRepository {
  Future<List<CharacterModel>> getAllcharacters(int pageNumber);
}

class CharactorRepositoryImp implements CharactorRepository {
  final ApiClient apiClient;

  CharactorRepositoryImp({required this.apiClient});

  @override
  Future<List<CharacterModel>> getAllcharacters(int pageNumber) async {
    try {
      final response = await apiClient.get(
        'character',
        queryParameters: {'page': pageNumber},
      );

      final List<dynamic> results = response.data['results'];

      final List<CharacterModel> characters = results
          .map((characterJson) => CharacterModel.fromJson(characterJson))
          .toList();

      return characters;
    } catch (e) {
      debugPrint('Error fetching characters in repository: $e');
      rethrow;
    }
  }
}
