import '../client.dart';

class Resource {
  final String host;
  final String apiVersion;
  final Client client;

  Resource(this.client, this.host, this.apiVersion);
}
