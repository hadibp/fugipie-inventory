import 'package:flutter/material.dart';

// class DatePicker extends StatefulWidget {
//   const DatePicker({Key? key}) : super(key: key);

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   DateTime selectedDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//               child: Text(
//             '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
//             style: const TextStyle(fontSize: 25.0),
//           )),
//           ElevatedButton(
//             onPressed: () {
//               toselectDate(context);
//             },
//             child: const Text("Choose Date"),
//           ),
//         ],
//       ),
//     );
//   }

//   fromselectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );
//     if (selected != null && selected != selectedDate)
//       setState(() {
//         selectedDate = selected;
//       });
//   }

//   toselectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );
//     if (selected != null && selected != selectedDate)
//       setState(() {
//         selectedDate = selected;
//       });
//   }
// }

class DatePickerController   {
  var selecteddate = DateTime.now();

 

  //   fromselectDate(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now() ,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );
  //   if(selected != null ){
  //     // print(selected);
  //     return DateTime.now();
  //   }
  //   final date ='${selected!.day}/${selected.month}/${selected.year}';
  //   return date;
  // }
// double get subtotal => ;

}
