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
  Future<Items> query() async {
    final data = {};
    final response = await client.get(host, ['api/${apiVersion}/items']);
    return Items.fromJson(response);
  }
}
