// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment_8_menues_it32/screens/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helpers/constants.dart';
import '../helpers/contacts.dart';

class ContextScreen extends StatelessWidget {
  const ContextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPinkColor,
        title: const Text(
          "Context Menu",
          style: TextStyle(fontSize: 22),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text('DNYANESHWAR SHINDE'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Drop Down Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DropDown(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Context Menu'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: ContactList().contactList.length,
          itemBuilder: (context, idx) {
            return Column(
              children: [
                PopupMenuButton(
                  onSelected: (int index) {
                    if (index == 0) {
                      Fluttertoast.showToast(
                          gravity: ToastGravity.TOP_LEFT,
                          backgroundColor: Colors.red,
                          msg:
                              "Call ${ContactList().contactList[idx].contactName}");
                      // msg: "Hello");
                    } else {
                      Fluttertoast.showToast(
                          gravity: ToastGravity.TOP_LEFT,
                          backgroundColor: Colors.red,
                          msg:
                              "Message ${ContactList().contactList[idx].contactName}");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: MyListTile(idx: idx),
                  ),
                  itemBuilder: (context) {
                    return const [
                      PopupMenuItem(
                        child: MyMenuItem(
                          name: "Call",
                          color: Colors.white,
                        ),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: MyMenuItem(
                          name: "Message",
                          color: Colors.white,
                        ),
                        value: 1,
                      ),
                    ];
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key? key,
    required this.idx,
  }) : super(key: key);
  final int idx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.star_border,
        color: Colors.lightBlueAccent,
      ),
      title: Text(
        ContactList().contactList[idx].contactName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
      // subtitle: Text(
      //   ContactList().contactList[idx].contactNo,
      //   style: TextStyle(),
      // ),
    );
  }
}

class MyMenuItem extends StatelessWidget {
  const MyMenuItem({Key? key, required this.name, required this.color})
      : super(key: key);
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
