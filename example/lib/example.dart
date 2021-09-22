import 'dart:io';

import 'package:arcadier/arcadier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Application {
  static final Arcadier arcadier = Arcadier(
    host: dotenv.env['CLIENT_HOST']?.toString() ?? '',
    clientId: dotenv.env['CLIENT_ID']?.toString() ?? '',
    clientSecret: dotenv.env['CLIENT_SECRET']?.toString() ?? '',
  );
}

// Arcadier arcadier = Arcadier(host: host, clientId: clientId, clientSecret: clientSecret);

void main() async {
  dotenv.testLoad(fileInput: File('example/.env').readAsStringSync());
  Arcadier arcadier = Arcadier(
    host: dotenv.get('CLIENT_HOST', fallback: ''),
    clientId: dotenv.get('CLIENT_ID', fallback: ''),
    clientSecret: dotenv.get('CLIENT_SECRET', fallback: ''),
  );
  // var arcadier = Application.arcadier;
  // See Arcadier API documentation for details
  // https://apiv2.arcadier.com/
  // authentication token
  final adminToken = await arcadier.token.forAdmin();
  final userToken =
      await arcadier.token.forUser(dotenv.get('USER_NAME', fallback: ''), dotenv.get('USER_PASSWORD', fallback: ''));
  // user info
  // user register
  // user updates
  // get items list
  // get item info
  // get categories list
  // get categories with hierarchy list
}
