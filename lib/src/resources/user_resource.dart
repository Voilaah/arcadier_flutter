// ignore_for_file: unnecessary_brace_in_string_interps

import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class UserResource extends Resource {
  UserResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  Future<User> get(String userId) async {
    final data = {'userId': userId};
    final response = await client.get(host, ['api/${apiVersion}/users/${userId}']);
    return User.fromJson(response);
  }
}
