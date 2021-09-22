# Arcadier Flutter

A third-party Flutter package for integrating with Arcadier API.

## Getting Started

This project is a starting point for a Flutter application.

1. Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  arcadier: ^0.1.0
```

2. Install it from the command

`flutter pub get`

3. Import it

`import 'package:arcadier/arcadier.dart';`

4. Use it

```flutter
// instance an Arcadier Object
final arcadier = Arcadier("host", "clientId", "clientSecret");

// token creation: admin or user (merchant or customer)
final adminToken = await arcadier.token.forAdmin();
final userToken = await arcadier.token.forUser("john@email.com", "mypassword");

// retrieve a user info
final user = await arcadier.user(userId);

// retrieve items
final items = await arcadier.items.query();
final items = await arcadier.items.query(limit: 20);
final items = await arcadier.items.query(limit: 20, page: 1);
final items = await arcadier.items.query(limit: 20, query: "search term");
final items = await arcadier.items.query(orderBy: "name", order: "asc");

// retrieve an item
final item = await arcadier.item(itemId);

// retrieve categories
final categories = await arcadier.categories.query();

// retrieve a category
final category = await arcadier.category(categoryId);



```
