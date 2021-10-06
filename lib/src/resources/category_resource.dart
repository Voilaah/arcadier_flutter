import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class CategoryResource extends Resource {
  CategoryResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<CategoryResponse> query(String categoryId) async {
    final data = {'categoryId': categoryId};
    final response = await client.get(host, ['api/$apiVersion/categories']);
    return CategoryResponse.fromJson(response);
  }
}
