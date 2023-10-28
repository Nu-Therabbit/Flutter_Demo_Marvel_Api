import 'package:bloc/bloc.dart';
import 'package:marvel/api/model/character/character.dart';
import 'package:marvel/domain/usecase/get_characters_use_case.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  final GetCharacterUseCase _getCharactersUseCase = GetCharacterUseCase();

  Future fetchCharacters() async {
    final result = await _getCharactersUseCase.execute();
    emit(CharacterLoaded(result.data!));
  }
}
