import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemResource extends Resource {
  ItemResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<ItemResponse> get(String itemId) async {
    final data = {'itemId': itemId};
    final response = await client.get(host, ['/api/$apiVersion/items/$itemId']);
    return ItemResponse.fromJson(response);
  }
}
