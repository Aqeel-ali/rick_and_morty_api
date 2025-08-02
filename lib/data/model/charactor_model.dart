class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationInfo origin;
  final LocationInfo location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationInfo.fromJson(json['origin']),
      location: LocationInfo.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }
}

//location
class LocationInfo {
  final String name;
  final String url;

  LocationInfo({required this.name, required this.url});

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(name: json['name'], url: json['url']);
  }
}
