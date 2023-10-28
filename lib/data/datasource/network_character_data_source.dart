import 'package:marvel/api/model/character/character.dart';

abstract class NetworkCharacterDataSource {
  Future<List<Character>> getCharacters();
}
