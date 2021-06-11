import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_flutter_app/providers/users.dart';
import 'package:simple_crud_flutter_app/routes/app_routes.dart';
import 'package:simple_crud_flutter_app/views/user_form.dart';
import 'package:simple_crud_flutter_app/views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: UserList(),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
