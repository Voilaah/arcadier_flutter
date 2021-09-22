library arcadier;

import 'package:flutter/material.dart';
import 'src/client.dart';
import 'src/resources/category_resource.dart';
import 'src/resources/categories_resources.dart';
import 'src/resources/item_resource.dart';
import 'src/resources/items_resource.dart';
import 'src/resources/marketplace_resource.dart';
import 'src/resources/token_resource.dart';
import 'src/resources/user_resource.dart';
import 'src/responses.dart';

const String _VERSION = "0.1.0";

/// Arcadier
///
/// ```dart
/// Arcadier arcadier = Arcadier(host, clientId, clientSecret);
/// ```
class Arcadier {
  /// your marketplace host url
  /// Ex: https://{{your-marketplace}}.arcadier.io
  final String host;
  // Arcadier API version
  final String apiVersion;
  // Arcadier API Key
  final String clientId;
  final String clientSecret;

  // HTTP Client
  late Client _client;
  Client get client {
    return _client;
  }

  // Resources
  // Collections
  late TokenResource token;
  late ItemsResource items;
  late CategoriesResource categories;
  late MarketplaceResource marketplace;

  // Single record
  late ItemResource _item;
  late CategoryResource _category;
  late UserResource _user;

  // Constructor
  Arcadier({required this.host, required this.clientId, required this.clientSecret, this.apiVersion = 'v2'}) {
    debugPrint('Init Arcadier with host...$host');
    //
    _client = Client(clientId, clientSecret, apiVersion);
    _client.version = _VERSION;
    _initResources();
  }

  _initResources() {
    items = ItemsResource(_client, host, apiVersion);
    marketplace = MarketplaceResource(_client, host, apiVersion);
    categories = CategoriesResource(_client, host, apiVersion);
    //
    token = TokenResource(_client, host, apiVersion);
    _item = ItemResource(_client, host, apiVersion);
    _user = UserResource(_client, host, apiVersion);
    _category = CategoryResource(_client, host, apiVersion);
  }

  Future<Item> item(String id) async {
    return await _item.get(id);
  }

  Future<User> user(String id) async {
    return await _user.get(id);
  }
}
