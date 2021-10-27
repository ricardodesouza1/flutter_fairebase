import 'package:flutter/material.dart';
import 'package:flutter_firebase/data/dummy_user.dart';
import 'package:flutter_firebase/models/user.dart';

class Users with ChangeNotifier{
  final Map< String, User> _items = {...DUMMY_USER};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}