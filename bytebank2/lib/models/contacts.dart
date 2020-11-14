class Contacts {
  final int id;
  final String fullName;
  final int accountNumber;

  Contacts(this.id, this.fullName, this.accountNumber);

  @override
  String toString() {
    // TODO: implement toString
    return 'Contacts {id: $id, fullName: $fullName, accountNumber: $accountNumber}';
  }
}
