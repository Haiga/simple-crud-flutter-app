import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud_flutter_app/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.blueGrey,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
          width: 100,
        ));
  }
}
