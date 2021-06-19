import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../pageInfo.dart';
import 'searchResult.dart';

part 'searchListResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchListResponse {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final String? regionCode;
  final PageInfo pageInfo;
  final List<SearchResult> items;

  SearchListResponse(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      this.regionCode,
      required this.pageInfo,
      required this.items});

  factory SearchListResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
