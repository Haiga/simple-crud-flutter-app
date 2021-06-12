import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_flutter_app/models/user.dart';
import 'package:simple_crud_flutter_app/providers/users.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(User(
                      id: _formData['id'].toString(),
                      name: _formData['name'].toString(),
                      email: _formData["email"].toString(),
                      avatarUrl: _formData["url"].toString()));
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  if (value.trim().length < 2) {
                    return "Min 3 letters";
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do avatar'),
                onSaved: (value) => _formData['url'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
