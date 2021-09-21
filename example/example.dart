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
  await dotenv.load();
  print(dotenv.env['CLIENT_HOST']?.toString());
  Arcadier arcadier = Arcadier(
    host: dotenv.env['CLIENT_HOST']?.toString() ?? '',
    clientId: dotenv.env['CLIENT_ID']?.toString() ?? '',
    clientSecret: dotenv.env['CLIENT_SECRET']?.toString() ?? '',
  );
  // var arcadier = Application.arcadier;
  // See Arcadier API documentation for details
  // https://apiv2.arcadier.com/
  final token = await arcadier.token.forAdmin();
  debugPrint(token.toString());
  // final token = await arcadier.token.forUser("chris@voilaah.com", "4242424242424242", "12", "2020");
}
