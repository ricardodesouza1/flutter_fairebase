import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/provider/user.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();  
  final Map<String, String> _formData = {};

  static const routeName = '/extractArguments';

  void _loadFormData(User user){ 
    if(user != null){
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
    
  }   
  
  @override
  Widget build(BuildContext context) {
   // final user = ModalRoute.of(context).settings.arguments as User;
    //User user2 = user;
    //print(user.id);
    //print(user.name);
    //print(user.email);
    //print(user.avatarUrl);
   // if(user != null){
    //loadFormData(user);
    //}
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuários'),
        actions: <Widget>[
          IconButton(onPressed: (){
            final isValid = _form.currentState!.validate();
           
            if(isValid) {
              _form.currentState!.save();
              Provider.of<Users>(context, listen: false).put(User(
                id: _formData["id"].toString(),
                name: _formData["name"].toString(),
                email: _formData["email"].toString(),
                avatarUrl: _formData["avatarUrl"].toString(),
              ));
              Navigator.of(context).pop();
            }
          }, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Infrome nome válido!';
                  }
                  if(value.trim().length < 3){
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }
                  
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Infrorme um email válido!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] =  value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
               /* validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Informe a URL do Avatar válido!';
                  }    
                  return null;
                },*/
                onSaved: (value) => _formData['avatarUrl']  = value!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                
                onPressed: (){
                  final isValid = _form.currentState!.validate();
           
                  if(isValid) {
                    _form.currentState!.save();
                    Provider.of<Users>(context, listen: false).put(User(
                      id: _formData["id"].toString(),
                      name: _formData["name"].toString(),
                      email: _formData["email"].toString(),
                      avatarUrl: _formData["avatarUrl"].toString(),
                    ));
                    Navigator.of(context).pop();
                  }
                }, 
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}