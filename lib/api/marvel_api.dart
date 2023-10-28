import 'package:logger/logger.dart';
import 'package:marvel/api/dio_builder.dart';
import 'package:marvel/api/model/character/character.dart';

import 'api_client.dart';
import 'exception/api_exception.dart';
import 'interceptor/authorization_interceptor.dart';
import 'interceptor/default_interceptor.dart';

class MarvelApi {
  final logger = Logger(printer: PrettyPrinter(methodCount: 0));
  final client = ApiClient(DioBuilder.create(
    "https://gateway.marvel.com/v1/public/",
    DefaultInterceptor(),
    AuthorizationInterceptor(),
  ).build());

  Future<List<Character>> getCharacters() async {
    final response = await client.getCharacters();
    if (!response.isSuccess()) {
      throw FetchDataException(
          "Get character exception code: ${response.code}");
    } else {
      return response.data.results;
    }
  }
}
