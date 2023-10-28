import 'package:marvel/api/marvel_api.dart';
import 'package:marvel/api/model/character/character.dart';
import 'package:marvel/data/datasource/network_character_data_source.dart';

class NetworkCharacterDataSourceImpl extends NetworkCharacterDataSource {
  final api = MarvelApi();

  @override
  Future<List<Character>> getCharacters() async {
    try {
      final result = await api.getCharacters();
      print(result);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
