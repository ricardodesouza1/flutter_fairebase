import 'package:flutter/material.dart';
import 'package:flutter_firebase/provider/user.dart';
import 'package:flutter_firebase/routes/app_routes.dart';
import 'package:flutter_firebase/views/user_form.dart';
import 'package:flutter_firebase/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         
          primarySwatch: Colors.green,
        ),
        //home: const UserList(),
        routes: {
          AppRoutes.HOME: (_) => const  UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
         
      ),
    );
  }
}

