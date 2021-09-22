import 'package:arcadier/arcadier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class Application {
  static final Arcadier arcadier = Arcadier(
    host: dotenv.get('CLIENT_HOST', fallback: ''),
    clientId: dotenv.get('CLIENT_ID', fallback: ''),
    clientSecret: dotenv.get('CLIENT_SECRET', fallback: ''),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  int _page = 1;
  bool _isLoading = false;

  Arcadier arcadier = Application.arcadier;
  List<Item> _products = [];

  void _setMessage(String str) {
    _message = str;
  }

  _adminToken() async {
    setState(() {
      _isLoading = true;
    });
    final token = await arcadier.token.forAdmin();
    _setMessage(token.accessToken);
    print(token.accessToken);
    setState(() {
      _isLoading = false;
    });
  }

  _userToken() async {
    setState(() {
      _isLoading = true;
    });
    final token =
        await arcadier.token.forUser(dotenv.get('USER_NAME', fallback: ''), dotenv.get('USER_PASSWORD', fallback: ''));
    _setMessage(token.accessToken);
    print(token.accessToken);
    setState(() {
      _isLoading = false;
    });
  }

  _fetchUser() async {
    setState(() {
      _isLoading = true;
    });
    final token =
        await arcadier.token.forUser(dotenv.get('USER_NAME', fallback: ''), dotenv.get('USER_PASSWORD', fallback: ''));
    final user = await arcadier.user(token.userId);
    print("userId: ${token.userId}, user displayname: ${user.email}");
    _setMessage(token.userId + '\n' + user.email);
    setState(() {
      _isLoading = false;
    });
  }

  _fetchItems() async {
    setState(() {
      _isLoading = true;
    });
    final items = await arcadier.items.query();
    String msg = "Nb items:${items.totalRecords}\n";
    msg = msg + items.records.map((x) => x.name).toString();
    print(msg);
    _setMessage(msg);
    setState(() {
      _isLoading = false;
    });
  }

  _fetchCategories() async {
    setState(() {
      _isLoading = true;
    });
    final categories = await arcadier.categories.query();
    String msg = "Nb categories:${categories.totalRecords}\n";
    msg = msg + categories.records.map((x) => x.name).toString();
    print(msg);
    _setMessage(msg);
    setState(() {
      _isLoading = false;
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
                await _adminToken();
              },
              child: const Text('Admin token'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _userToken();
              },
              child: const Text('User token'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _fetchUser();
              },
              child: const Text('User Info'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _fetchCategories();
              },
              child: const Text('Categories list'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _fetchItems();
              },
              child: const Text('Items list'),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Item detail'),
            ),
            const Divider(
              height: 20,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),
            const SizedBox(
              width: double.infinity,
              child: Text("Result:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
                : Text(_message),
          ],
        ),
      ),
    );
  }
}
