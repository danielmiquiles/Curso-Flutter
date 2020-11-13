import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_title.dart';
import 'package:flutter_crud/data/users_data.dart';

class UserList extends StatelessWidget {
  final users = {...DUMMY_USERS};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista de Usuários')),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserTile(
          users.values.elementAt(index),
        ),
      ),
    );
  }
}
