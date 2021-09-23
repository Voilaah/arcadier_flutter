import 'dart:convert';

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
  var encoder = const JsonEncoder.withIndent('  ');
  Arcadier arcadier = Application.arcadier;
  List<Item> _products = [];

  void _setMessage(String str) {
    _message = str;
  }

  String _prettyPrint(jsonObject) {
    return encoder.convert(jsonObject);
  }

  _adminToken() async {
    setState(() {
      _isLoading = true;
    });
    final token = await arcadier.token.forAdmin();
    String msg = _prettyPrint(token);
    _setMessage(msg);
    print(msg);
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
    String msg = _prettyPrint(token);
    _setMessage(msg);
    print(msg);
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
    String msg = _prettyPrint(user);
    _setMessage(msg);
    print(msg);
    setState(() {
      _isLoading = false;
    });
  }

  _fetchItem(itemId) async {
    setState(() {
      _isLoading = true;
    });
    final item = await arcadier.item(itemId);
    String msg = _prettyPrint(item);
    _setMessage(msg);
    print(msg);
    setState(() {
      _isLoading = false;
    });
  }

  _fetchItems({
    int? page,
    int? perPage,
    String? sort,
    String? search,
    String? sellerId,
    List<String>? categories,
    String? minPrice,
    String? maxPrice,
    String? tax,
    DateTime? createdStartDate,
    DateTime? createdEndDate,
    DateTime? updatedStartDate,
    DateTime? updatedEndDate,
  }) async {
    setState(() {
      _isLoading = true;
    });
    final items = await arcadier.items.query(
      page: page,
      perPage: perPage,
      sort: sort,
      search: search,
      sellerId: sellerId,
      categories: categories,
      minPrice: minPrice,
      maxPrice: maxPrice,
      tax: tax,
      createdStartDate: createdStartDate,
      createdEndDate: createdEndDate,
      updatedStartDate: updatedStartDate,
      updatedEndDate: updatedEndDate,
    );
    String msg = "Nb items:${items.totalRecords}\n";
    msg = msg +
        items.records.map((x) {
          return x.id + ':' + x.name;
        }).toString();
    print(msg);
    _setMessage(msg);
    // String msg = _prettyPrint(items);
    // _setMessage(msg);
    // print(msg);
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
    msg = msg +
        categories.records.map((x) {
          return x.id + ':' + x.name;
        }).toString();
    print(msg);
    _setMessage(msg);
    // String msg = _prettyPrint(catgories);
    // _setMessage(msg);
    // print(msg);
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
      body: SingleChildScrollView(
        child: Padding(
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
                onPressed: () async {
                  await _fetchItems(categories: ['862e7995-3d18-427e-a906-31902d55c11d']);
                },
                child: const Text('List Items for categoryId'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _fetchItems(search: "Flutter");
                },
                child: const Text('Search Items with search term'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _fetchItem("121b852a-6fd3-4627-bd34-27f95cc569e7");
                },
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
      ),
    );
  }
}
