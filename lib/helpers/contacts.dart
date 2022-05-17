class Contact {
  String contactName = "";
  String contactNo = "";

  Contact(name, no) {
    contactName = name;
    contactNo = no;
  }
}

class ContactList {
  final List<Contact> contactList = [
    Contact('Ajit', "8329763258"),
    Contact('Gulab', "8345697120"),
    Contact('Shiva', "9468451132"),
    Contact('Dnyan', "87896214850"),
    Contact('Chandan', "9356697120"),
    Contact('Ashutosh', "7789632014"),
  ];
}
