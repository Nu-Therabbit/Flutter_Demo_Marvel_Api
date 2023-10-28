import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: "offset")
  final int offset;
  @JsonKey(name: "limit")
  final int limit;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "count")
  final int count;
  @JsonKey(name: "results")
  final List<T> results;

  DataResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory DataResponse.fJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return DataResponse(
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
      results: json['results'].map(fromJsonT).cast<T>().toList(),
    );
  }

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}
