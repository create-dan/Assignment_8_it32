// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment_8_menues_it32/screens/context_menu.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget myCredentials() {
    return Center(
      child: Text(
        'name dnyan',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  String dropdownValue = 'One';

  Widget dropdownList() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          onTap: () {
            print(value);
            Fluttertoast.showToast(msg: "Clicked: $value");
          },
        );
      }).toList(),
    );
  }

  // Widget contextMenu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   key: _bottomNavigationKey,
      //   items: <Widget>[
      //     Icon(Icons.star, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.compare_arrows, size: 30),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _page = index;
      //     });
      //   },
      // ),
      body: Container(
        color: Colors.blueAccent,
        // child: Center(
        //   child: _page == 0
        //       ? myCredentials()
        //       : _page == 1
        //           ? dropdownList()
        //           : ContextScreen(),
        // ),
        child: ContextScreen(),
      ),
    );
  }
}
