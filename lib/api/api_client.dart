import 'package:dio/dio.dart';
import 'package:marvel/api/model/character/character.dart';
import 'package:retrofit/retrofit.dart';

import 'model/api_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("characters")
  Future<ApiResponse<Character>> getCharacters();
}
