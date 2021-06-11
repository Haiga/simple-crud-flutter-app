import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_flutter_app/components/user_tile.dart';
import 'package:simple_crud_flutter_app/models/user.dart';
import 'package:simple_crud_flutter_app/providers/users.dart';
import 'package:simple_crud_flutter_app/routes/app_routes.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context); //, listen: false
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: [
          IconButton(
              onPressed: () {
                //users.put(User(
                //    id: '', name: 'Ted', email: 'Ted@Ted.com', avatarUrl: ''));
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}
