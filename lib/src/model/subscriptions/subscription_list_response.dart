import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../page_info.dart';
import 'subscription.dart';

part 'subscription_list_response.g.dart';

/// Returns subscription resources that match the API request criteria.
@JsonSerializable(explicitToJson: true)
class SubscriptionListResponse {
  /// Identifies the API resource's type. The value will be
  /// youtube#SubscriptionListResponse.
  final String kind;

  /// The Etag of this resource.
  final String etag;

  /// The token that can be used as the value of the pageToken parameter to
  /// retrieve the next page in the result set.
  final String? nextPageToken;

  /// The token that can be used as the value of the pageToken parameter to retrieve the previous page in the result set.
  final String? prevPageToken;

  /// The pageInfo object encapsulates paging information for the result set.
  final PageInfo pageInfo;

  /// A list of subscriptions that match the request criteria.
  final List<Subscription> items;

  SubscriptionListResponse({
    required this.kind,
    required this.etag,
    this.nextPageToken,
    this.prevPageToken,
    required this.pageInfo,
    required this.items,
  });

  factory SubscriptionListResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionListResponseToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
