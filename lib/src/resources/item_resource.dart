import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemResource extends Resource {
  ItemResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<Item> get(String id) async {
    final data = {'itemId': id};
    final response = await client.post(host, ['token'], data: data);
    return Item.fromJson(response);
  }
}
