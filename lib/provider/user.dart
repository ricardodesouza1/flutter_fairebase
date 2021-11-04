
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/data/dummy_user.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier{
  static const _baseUrl = '-----';
  final Map< String, User> _items = {...DUMMY_USER};

  Future<List<User>> get all async{
    final response = await http.post(
          Uri.parse('$_baseUrl/users.json'), 
      );
      return json.decode(response.body);
    //return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  Future<void> put(User user) async{
    if(user.name ==  null){
      return;
    }
    if(user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)){

      _items.update(user.id, (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }else{
      final response = await http.post(
        Uri.parse('$_baseUrl/users.json'), 
        body: json.encode({
          "name": user.name,
          "email": user.email,
          "avatarUrl": user.avatarUrl,
        }),
      );

      final id = json.decode(response.body)['name'];
      print(json.decode(response.body));
      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ),
      );
    }
    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}