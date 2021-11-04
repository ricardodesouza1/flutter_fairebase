import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/provider/user.dart';
import 'package:flutter_firebase/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user, { Key? key } ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == 'null' || user.avatarUrl.isEmpty
      ? const CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return Card(
      child: ListTile(
          
          leading: avatar,
          title: Text(user.name),
          subtitle: Text(user.id),
          trailing: SizedBox(
            width: 100,
            child: Row(children: [
              IconButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                }, 
                icon: const Icon(Icons.edit)),
              IconButton( 
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text('Tem certeza???'),
                      actions: <Widget>[
                        TextButton(onPressed: (){
                          Navigator.of(context).pop(false);
                        }, child: const Text('Não'),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop(true);
                        }, child: const Text('Sim'),
                        )
                      ],
                    )
                    ).then((confirmado) {
                      if(confirmado){
                        Provider.of<Users>(context, listen: false).remove(user);
                      }
                    });
                }, 
                icon:  const Icon(Icons.delete)),
              
              ],),
          ),
      ),
    );
  }
}