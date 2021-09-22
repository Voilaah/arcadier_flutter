import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class CategoriesResource extends Resource {
  CategoriesResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<Categories> query() async {
    final data = {};
    final response = await client.get(host, ['api/${apiVersion}/categories']);
    return Categories.fromJson(response);
  }
}
