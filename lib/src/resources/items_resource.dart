import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemsResource extends Resource {
  ItemsResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);
}
