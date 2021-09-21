import 'package:flutter_test/flutter_test.dart';
import 'package:arcadier/arcadier.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Application {
  // static final Arcadier arcadier = Arcadier(
  //   host: env['CLIENT_HOST']?.toString() ?? '',
  //   clientId: env['CLIENT_ID']?.toString() ?? '',
  //   clientSecret: env['CLIENT_SECRET']?.toString() ?? '',
  // );
}

void main() async {
  ///
  /// Initiate Algolia in your project
  ///
  // var arcadier = Application.arcadier;
  Arcadier? arcadier;

  setUp(() {
    // setup mock
    arcadier = Application.arcadier;
  });

  tearDown(() {
    // arcadier = null;
  });

  group("Token", () {
    test('Create a token', () async {
      // arcadier!.client.httpClient = client!.mockCreateTokenResponse();
      final response = await arcadier!.token.forAdmin();
      expect(response.tokenType, "bearer");
    });
  });
}
