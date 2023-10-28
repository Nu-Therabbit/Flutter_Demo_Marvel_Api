import 'package:marvel/api/model/character/character.dart';
import 'package:marvel/data/character_repository_impl.dart';
import 'package:marvel/repository/character_repository.dart';

import '../result.dart';

class GetCharacterUseCase {
  final CharacterRepository _characterRepository = CharacterRepositoryImpl();

  Future<Result<List<Character>>> execute() async {
    try {
      final response = await _characterRepository.getCharacters();
      return Result.completed(response);
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
