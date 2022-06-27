import 'package:flutter/material.dart';



class dropdowndate extends StatefulWidget {
  const dropdowndate({
    Key? key,
    required List<String> listitem,
  })  : _listitem = listitem,
        super(key: key);

  final List<String> _listitem;

  @override
  State<dropdowndate> createState() => _dropdowndateState();
}

class _dropdowndateState extends State<dropdowndate> {
  var _currentvalue = 'details/month';

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
            items: widget._listitem.map((String dropdownitem) {
              return DropdownMenuItem<String>(
                value: dropdownitem,
                child: Text(dropdownitem),
              );
            }).toList(),
            onChanged: (String? newvalue) {
              setState(() {
                this._currentvalue = newvalue!;
              });
            },
            value: _currentvalue,
            dropdownColor: Color.fromARGB(255, 41, 41, 65),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            iconSize: 30.0,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
