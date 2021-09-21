import 'dart:io';

import 'package:arcadier/src/helpers/helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arcadier/arcadier.dart';
import './mock/test_client.dart';
import 'dart:io' as io;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  TestClient? client;
  Arcadier? arcadier;

  String? clientHost;
  String? clientId;
  String? clientSecret;

  setUp(() {
    // setup mock
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
    clientHost = dotenv.env['CLIENT_HOST'];
    clientId = dotenv.env['CLIENT_ID'];
    clientSecret = dotenv.env['CLIENT_SECRET'];

    client = new TestClient();
    arcadier = Arcadier(host: clientHost ?? '', clientId: clientId ?? '', clientSecret: clientSecret ?? '');
  });

  tearDown(() {
    client = null;
    arcadier = null;
    clientHost = null;
    clientId = null;
    clientSecret = null;
  });

  group("Initiate instance", () {
    test('Create an instance with clientId', () {
      expect(arcadier!.clientId, clientId);
      expect(arcadier!.apiVersion, "v2");
    });
  });

  group("Token", () {
    test('Create a token for Admin', () async {
      arcadier!.client.httpClient = client!.mockCreateTokenResponse();
      final response = await arcadier!.token.forAdmin();
      expect(response.tokenType, "bearer");
    });
    test('Create a token for User', () async {
      arcadier!.client.httpClient = client!.mockCreateTokenResponse();
      final response = await arcadier!.token.forUser("john@email.com", "mypassword");
      expect(response.tokenType, "bearer");
    });
  });

  // group("Source", () {
  //   test('Create a source', () async {
  //     omise!.client.httpClient = client!.mockCreateSourceResponse();
  //     final response = await omise!.source.create(10000, "thb", "internet_banking_bay");
  //     expect(response.object, "source");
  //   });
  // });

  // group("Capability", () {
  //   test('Retrieve a capability', () async {
  //     omise!.client.httpClient = client!.mockGetCapabilityResponse();
  //     final response = await omise!.capability.retrieve();
  //     expect(response.object, "capability");
  //   });
  // });
}
