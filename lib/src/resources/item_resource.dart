import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemResource extends Resource {
  ItemResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<Item> get(String itemId) async {
    final data = {'itemId': itemId};
    final response = await client.get(host, ['/api/${apiVersion}/items/${itemId}']);
    return Item.fromJson(response);
  }
}
