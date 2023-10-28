import 'package:json_annotation/json_annotation.dart';
import 'package:marvel/api/model/data_response.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: "code")
  final int code;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "copyright")
  final String copyright;
  @JsonKey(name: "attributionText")
  final String attributionText;
  @JsonKey(name: "attributionHTML")
  final String attributionHTML;
  @JsonKey(name: "data")
  final DataResponse<T> data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  bool isSuccess() {
    return code == 200;
  }
}
