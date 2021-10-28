import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/user_tile.dart';
import 'package:flutter_firebase/provider/user.dart';
import 'package:flutter_firebase/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            }, 
            icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}