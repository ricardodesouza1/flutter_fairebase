import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/data/dummy_user.dart';

class UserList extends StatelessWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const user = {...DUMMY_USER};
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de usuários'),
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, i)=> Text(user.values.elementAt(i).name),
        ),
    );
  }
}