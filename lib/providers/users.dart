import 'package:flutter/cupertino.dart';
import 'package:simple_crud_flutter_app/data/dummy_users.dart';
import 'package:simple_crud_flutter_app/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }
}
