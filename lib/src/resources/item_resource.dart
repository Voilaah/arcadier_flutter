import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class ItemResource extends Resource {
  ItemResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);
}
