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
  Future<UserResponse> get(String userId) async {
    final data = {'userId': userId};
    final response = await client.get(host, ['api/${apiVersion}/users/${userId}']);
    return UserResponse.fromJson(response);
  }

  /// Register a BUYER account
  Future<TokenResponse> register(String email, String password, String confirm_password,
      {required String adminToken}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $adminToken',
    };
    final payload = {'Email': email, 'Password': password, 'ConfirmPassword': confirm_password};
    final response = await client.post(host, ['api/${apiVersion}/accounts/register'],
        data: json.encode(payload), extraHeaders: extraHeaders);
    return TokenResponse.fromJson(response);
  }

  /// Update a userId account information
  ///
  /// token can be adminToken, merchantToken or userToken
  Future<UserResponse> update(String userId, UserRequest userRequest, {required String token}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    final payload = userRequest.toJson();
    final response = await client.put(host, ['api/${apiVersion}/users/$userId'],
        data: json.encode(payload), extraHeaders: extraHeaders);
    return UserResponse.fromJson(response);
  }

  /// Promotes a BUYER to MERCHANT account
  Future<ResultResponse> promote(String userId,
      {String newRole = "merchant", required String adminId, required String adminToken}) async {
    dynamic extraHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $adminToken',
    };
    final payload = {'userId': userId};
    final response = await client.put(host, ['api/${apiVersion}/admins/$adminId/users/$userId/roles/$newRole'],
        data: json.encode(payload), extraHeaders: extraHeaders);
    // print('-----------');
    // print(response);
    // print('-----------');
    return ResultResponse.fromJson(response);
  }
}
