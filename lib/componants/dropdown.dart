import 'package:flutter/material.dart';

class Dropdowndate extends StatefulWidget {
  const Dropdowndate({
    Key? key,
  }) : super(key: key);

  // final List<String> _listitem;

  @override
  State<Dropdowndate> createState() => _DropdowndateState();
}

class _DropdowndateState extends State<Dropdowndate> {
  var _currentvalue = 'details/month';
  final _listitem = ['one', 'two', 'three', 'four', 'details/month'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white, width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: 150.0,
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            elevation: 2,
            isExpanded: true,
            items: _listitem.map((String dropdownitem) {
              return DropdownMenuItem<String>(
                value: dropdownitem,
                child: Text(dropdownitem),
              );
            }).toList(),
            onChanged: (String? newvalue) {
              setState(() {
                _currentvalue = newvalue!;
              });
            },
            value: _currentvalue,
            dropdownColor: Color.fromARGB(255, 41, 41, 65),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 30.0,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
