import 'package:bytebank2/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _controllerFullName = TextEditingController();

  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  _criaContato() {
    final String fullName = _controllerFullName.text;
    final int accountNumber = int.tryParse(_controllerAccountNumber.text);

    final Contacts newContact = Contacts(fullName, accountNumber);

    Navigator.pop(context, newContact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerFullName,
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controllerAccountNumber,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    _criaContato();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
