import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class UserResource extends Resource {
  UserResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

// ['api/${apiVersion}/users/{{userID}}']

}
