import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'snippet.dart';
import 'id.dart';

part 'search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResult {
  final String kind;
  final String etag;
  final Id id;
  final Snippet? snippet;

  SearchResult(
      {required this.kind, required this.etag, required this.id, this.snippet});

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
