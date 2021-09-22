import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

const _defaultUrl = 'https://host.arcadier.io';
const _defaultVersion = 'v2';

class Client {
  late final String _clientId;
  late final String _clientSecret;
  late final String _apiVersion;
  late String version;
  String? _token;

  Client(this._clientId, this._clientSecret, this._apiVersion);

  http.Client httpClient = http.Client();

  get clientId => _clientId;
  get clientSecret => _clientSecret;
  get token => _token;
  set token(value) => _token = value;

  /// Makes a post request to [host] by following [path] with [data]
  Future<Map<String, dynamic>> post(String host, final List<String> path,
      {final dynamic data, dynamic extraHeaders}) async {
    final uri = createUri(host, path);
    final headers = createHeader(extraHeaders);

    final response =
        await httpClient.post(uri, body: data, headers: headers).timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });
    return processResponse(response);
  }

  /// Makes a get request from [host] by following [path]
  Future<Map<String, dynamic>> get(String host, final List<String> path, {dynamic extraHeaders}) async {
    final uri = createUri(host, path);
    final headers = createHeader(extraHeaders);
    final response = await httpClient.get(uri, headers: headers).timeout(const Duration(seconds: 60), onTimeout: () {
      throw TimeoutException('The connection has timed out, Please try again!');
    });
    return processResponse(response);
  }

  /// Create a Uri from [host] and [path]
  Uri createUri(String host, List<String> path) {
    final uri = Uri(scheme: 'https', host: host, pathSegments: path);
    return uri;
  }

  /// Build a basic authentication header
  String basicAuth() {
    return 'Basic ' + base64Encode(utf8.encode('$_clientId:'));
  }

  /// Build a Bearer authentication header
  Map<String, String> bearerAuth() {
    return <String, String>{HttpHeaders.authorizationHeader: 'Bearer $_token'};
  }

  /// Create a header
  Map<String, String> createHeader(dynamic extraHeaders) {
    final headers = <String, String>{
      // 'Authorization': this.basicAuth(),
      // 'Arcadier-Version': _apiVersion,
      // 'Cache-Control': 'no-cache',
      // 'Content-Type': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    if (extraHeaders != null) headers.addEntries(extraHeaders.entries);
    if (null != token) {
      headers.addAll(bearerAuth());
    }
    return headers;
  }

  /// Deserialize JSON from [response]
  Map<String, dynamic> processResponse(http.Response response) {
    final responseStatusCode = response.statusCode;

    Map<String, dynamic>? map;
    try {
      map = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      // Throwing later.
    }
    if (responseStatusCode != 200) {
      if (map == null || map['error'] == null) {
        throw UnknownTypeException('The status code returned was $responseStatusCode but no error was provided.');
      }

      if (map != null && map['error'] != null) {
        throw InvalidRequestException(responseStatusCode.toString(), map['error'].toString());
      } else {
        throw UnknownTypeException('The status code returned was $responseStatusCode but the error type is unknown.');
      }
    }
    if (map == null) {
      throw UnknownTypeException('The JSON returned was unparsable (${response.body}).');
    }
    return map;
  }
}
