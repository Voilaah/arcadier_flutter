import 'package:arcadier/arcadier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class Application {
  static final Arcadier arcadier = Arcadier(
    host: dotenv.get('CLIENT_HOST', fallback: ''),
    clientId: dotenv.get('CLIENT_ID', fallback: ''),
    clientSecret: dotenv.get('CLIENT_SECRET', fallback: ''),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcadier Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Arcadier Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";
  Arcadier arcadier = Application.arcadier;

  void _setMessage(String str) {
    setState(() {
      _message = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 6,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final token = await arcadier.token.forAdmin();
                _setMessage(token.accessToken);
                print(token.accessToken);
              },
              child: const Text('Admin token'),
            ),
            ElevatedButton(
              onPressed: () async {
                final token = await arcadier.token
                    .forUser(dotenv.get('USER_NAME', fallback: ''), dotenv.get('USER_PASSWORD', fallback: ''));
                _setMessage(token.accessToken);
                print(token.accessToken);
              },
              child: const Text('User token'),
            ),
            ElevatedButton(
              onPressed: () async {
                final token = await arcadier.token
                    .forUser(dotenv.get('USER_NAME', fallback: ''), dotenv.get('USER_PASSWORD', fallback: ''));
                final user = await arcadier.user(token.userId);
                print("userId: ${token.userId}, user displayname: ${user.email}");
                _setMessage(token.userId + '\n' + user.email);
              },
              child: const Text('User Info'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Categories list'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Category detail'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Items list'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Item detail'),
            ),
            const Divider(
              height: 20,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: const Text("Result:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 16),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
