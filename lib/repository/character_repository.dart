import 'package:marvel/api/model/character/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}
