library arcadier;

import 'package:arcadier/src/resources/category_resource.dart';
import 'package:arcadier/src/responses.dart';
import 'package:flutter/material.dart';

import 'src/client.dart';
import 'src/resources/categories_resources.dart';
import 'src/resources/item_resource.dart';
import 'src/resources/items_resource.dart';
import 'src/resources/marketplace_resource.dart';
import 'src/resources/token_resource.dart';

const String _VERSION = "0.1.0";

/// Arcadier
///
/// ```dart
/// Arcadier omise = Arcadier(clientId);
/// ```
class Arcadier {
  /// your marketplace host url
  /// Ex: https://{{your-marketplace}}.arcadier.io
  final String host;
  // Arcadier API version
  final String apiVersion;
  // Arcadier Public Key
  final String clientId;
  final String clientSecret;

  // HTTP Client
  late Client _client;
  Client get client {
    return _client;
  }

  // get host => _host;

  // Resources
  late TokenResource token;
  late ItemsResource items;
  late ItemResource _item;
  Future<Item> item(String id) async {
    return await _item.get(id);
  }

  late CategoriesResource categories;
  late CategoryResource category;
  late MarketplaceResource marketplace;
  // late AdminResource admin;
  // late MerchantResource merchant;
  // late UserResource user;
  // late SourceResource source;
  // late CapabilityResource capability;

  // Constructor
  Arcadier({required this.host, required this.clientId, required this.clientSecret, this.apiVersion = 'v2'}) {
    debugPrint('Init Arcadier with host...$host');
    //
    _client = Client(clientId, clientSecret, apiVersion);
    _client.version = _VERSION;
    _initResources();
  }

  _initResources() {
    token = TokenResource(_client, host, apiVersion);
    items = ItemsResource(_client, host, apiVersion);
    _item = ItemResource(_client, host, apiVersion);
    marketplace = MarketplaceResource(_client, host, apiVersion);
    categories = new CategoriesResource(_client, host, apiVersion);
    category = new CategoryResource(_client, host, apiVersion);
  }
}
