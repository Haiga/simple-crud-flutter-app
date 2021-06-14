import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_crud_flutter_app/models/user.dart';
import 'package:simple_crud_flutter_app/providers/users.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['url'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    _loadFormData(user);
  }

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
                initialValue: _formData['name'],
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
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['url'],
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
