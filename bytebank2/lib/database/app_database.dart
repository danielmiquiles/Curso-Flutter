import 'package:bytebank2/models/contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE contacts ('
          'id INTERGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTERGER)',
        );
      },
      version: 1,
    );
  });
}

Future<int> save(Contacts contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.fullName;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contacts>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contacts> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contacts contact = Contacts(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
