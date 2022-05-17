import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
// Initial Selected Value
  String dropdownvalue = 'One';

// List of items in our dropdown menu
  var items = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Drop Down"),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
            // color: Colors.white,
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.lightGreenAccent,
              ),
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Chip(
                        label: Text(items),
                        backgroundColor: Colors.tealAccent,
                      ),
                      // child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    Fluttertoast.showToast(
                      msg: 'You Clicked ${newValue}',
                      backgroundColor: Colors.red,
                    );
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
