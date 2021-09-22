import 'dart:convert';

import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemsResource extends Resource {
  ItemsResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  /// Query the items list with filters
  /// perPage: 50,
  // category: productCategory.id.toString(),
  // page: _page,
  // status: "publish",
  // stockStatus: "instock"
  Future<Items> query({
    int? page,
    int? perPage,
    String? sort,
    String? search,
    String? sellerId,
    List<String>? categories,
    String? minPrice,
    String? maxPrice,
    String? tax,
    DateTime? createdStartDate,
    DateTime? createdEndDate,
    DateTime? updatedStartDate,
    DateTime? updatedEndDate,
  }) async {
    Map<String, dynamic> payload = {};
    if (page != null) payload["pageNumber"] = page;
    if (perPage != null) payload["pageSize"] = perPage;
    if (search != null) payload["Keywords"] = search;
    if (sort != null) payload["Sort"] = sort;
    if (categories != null) payload["categories"] = categories;
    if (sellerId != null) payload["sellerID"] = sellerId;
    if (minPrice != null) payload["minPrice"] = minPrice;
    if (maxPrice != null) payload["maxPrice"] = maxPrice;
    if (tax != null) payload["tax"] = maxPrice;
    if (createdStartDate != null) payload["createdStartDate"] = createdStartDate.millisecondsSinceEpoch;
    if (createdEndDate != null) payload["createdEndDate"] = createdEndDate.millisecondsSinceEpoch;
    if (updatedStartDate != null) payload["updatedStartDate"] = updatedStartDate.millisecondsSinceEpoch;
    if (updatedEndDate != null) payload["updatedEndDate"] = updatedEndDate.millisecondsSinceEpoch;

    dynamic extraHeaders = {'Content-Type': 'application/json'};
    final response = await client.post(
      host,
      ['api/${apiVersion}/items'],
      data: json.encode(payload),
      extraHeaders: extraHeaders,
    );
    return Items.fromJson(response);
  }
}
