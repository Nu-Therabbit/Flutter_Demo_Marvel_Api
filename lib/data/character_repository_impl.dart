import 'package:marvel/api/model/character/character.dart';
import 'package:marvel/data/datasource/network_character_data_source.dart';
import 'package:marvel/data/datasource/network_character_data_source_impl.dart';
import 'package:marvel/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final NetworkCharacterDataSource characterDataSource =
      NetworkCharacterDataSourceImpl();

  @override
  Future<List<Character>> getCharacters() async {
    return await characterDataSource.getCharacters();
  }
}
