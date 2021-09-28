// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import '../requests.dart';
import 'resource.dart';
import '../responses.dart';
import '../client.dart';

class UserResource extends Resource {
  UserResource(Client client, String host, String apiVersion) : super(client, host, apiVersion);

  /// Retrieve a user (buyer or merchant) information
  Future<User> get(String userId) async {
    final data = {'userId': userId};
    final response = await client.get(host, ['api/${apiVersion}/users/${userId}']);
    return User.fromJson(response);
  }

  /// Register a BUYER account
  Future<Token> register(String email, String password, String confirm_password, {required String adminToken}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $adminToken',
    };
    final payload = {'Email': email, 'Password': password, 'ConfirmPassword': confirm_password};
    final response = await client.post(host, ['api/${apiVersion}/accounts/register'],
        data: json.encode(payload), extraHeaders: extraHeaders);
    return Token.fromJson(response);
  }

  /// Update a userId account information
  ///
  /// token can be adminToken, merchantToken or userToken
  Future<User> update(String userId, UserRequest userRequest, {required String token}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    final payload = userRequest.toJson();
    final response =
        await client.put(host, ['api/${apiVersion}/users/$userId'], data: payload, extraHeaders: extraHeaders);
    return User.fromJson(response);
  }

  /// Promotes a BUYER to MERCHANT account
  Future<Result> promote(String userId,
      {String newRole = "merchant", required String adminId, required String adminToken}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $adminToken',
    };
    final payload = {};
    final response = await client.put(host, ['api/${apiVersion}/admins/$adminId/users/$userId/roles/$newRole'],
        data: payload, extraHeaders: extraHeaders);
    return Result.fromJson(response);
  }
}
