import 'resource.dart';
import '../responses.dart';
import '../client.dart';

const _adminGrantType = "client_credentials";
const _userGrantType = "password";
const _defaultScope = "admin";

class TokenResource extends Resource {
  late String accessToken;

  TokenResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  /// Create a token for a User
  ///
  /// See Arcadier API documentation for details
  /// https://apiv2.arcadier.com/?_gl=1*6ywwfv*_ga*MTQyNTcxNDA1OS4xNjMxNjkzMzI1*_ga_7HH3RFVZQM*MTYzMjE5NTMwOC40LjEuMTYzMjE5NTM2NS4w#af2783ba-c16c-4ff4-a815-5d45f99aaf1a
  ///
  /// ```dart
  /// final token = await arcadier.token.createUser("4242424242424242", "4242424242424242", "john@email.com", "ChangeMeNow");
  /// ```
  Future<ArcadierToken> forUser(String username, String password,
      {String? grantType = _userGrantType, String? scope = _defaultScope}) async {
    final data = {
      'client_id': client.clientId,
      'client_secret': client.clientSecret,
      'grant_type': grantType,
      'scope': scope,
      'username': username,
      'password': password,
    };

    final response = await client.post(host, ['token'], data: data);
    accessToken = response['access_token'];
    return ArcadierToken.fromJson(response);
  }

  /// Create a token for an Admin
  ///
  /// See Arcadier API documentation for details
  /// https://apiv2.arcadier.com/?_gl=1*6ywwfv*_ga*MTQyNTcxNDA1OS4xNjMxNjkzMzI1*_ga_7HH3RFVZQM*MTYzMjE5NTMwOC40LjEuMTYzMjE5NTM2NS4w#af2783ba-c16c-4ff4-a815-5d45f99aaf1a
  ///
  /// ```dart
  /// final token = await arcadier.token.createAdmin("4242424242424242", "4242424242424242");
  /// ```
  Future<ArcadierToken> forAdmin({String? grantType = _adminGrantType, String? scope = _defaultScope}) async {
    final data = {
      'client_id': client.clientId,
      'client_secret': client.clientSecret,
      'grant_type': grantType,
      'scope': scope,
    };

    final response = await client.post(host, ['token'], data: data);
    accessToken = response['access_token'];
    return ArcadierToken.fromJson(response);
  }

  Future<void> refreshToken() async {
    // final refreshToken = await this._storage.read(key: 'refreshToken');
    // final response = await this.api.post('/users/refresh', data: {'token': refreshToken});

    // if (response.statusCode == 200) {
    //   this.accessToken = response.data['accessToken'];
    // }
  }
}
