// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

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

  Future<Token> post(String email, String password, String confirm_password, {required String adminToken}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $adminToken',
    };
    final payload = {'Email': email, 'Password': password, 'ConfirmPassword': confirm_password};
    final response = await client.post(host, ['api/${apiVersion}/accounts/register'],
        data: json.encode(payload), extraHeaders: extraHeaders);
    return Token.fromJson(response);
  }
}
