import 'package:arcadier/arcadier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(MyApp());
}

class Application {
  static final Arcadier arcadier = Arcadier(
    host: dotenv.env['CLIENT_HOST']?.toString() ?? '',
    clientId: dotenv.env['CLIENT_ID']?.toString() ?? '',
    clientSecret: dotenv.env['CLIENT_SECRET']?.toString() ?? '',
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
  int _counter = 0;
  Arcadier arcadier = Application.arcadier;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
              onPressed: () {
                var token = arcadier.token.forAdmin();
                print(token);
              },
              child: const Text('Admin token'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('User token'),
            ),
            ElevatedButton(
              onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
