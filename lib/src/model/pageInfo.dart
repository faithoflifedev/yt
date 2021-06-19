import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pageInfo.g.dart';

@JsonSerializable()
class PageInfo {
  final int totalResults;
  final int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
