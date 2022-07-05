import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import '../bloc/counter/counter_bloc.dart';

class StockPage extends StatelessWidget {
  StockPage({Key? key}) : super(key: key);

  final Lists = ['d'];

  @override
  Widget build(BuildContext context) {
    return Lists.isEmpty
        ? Scaffold(
            backgroundColor: Color(0xff181826),
            appBar: AppBar(
              backgroundColor: Color(0xff181826),
              title: Text(
                'Stock',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: FloatingActionButton(
                heroTag: 'hero1',
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.add,
                  size: 40.0,
                  color: Color(0xFF232338),
                ),
                onPressed: (() {
                  _stockbottommodal(context);
                }),
              ),
            ),
          )
        : StockList();
  }
}

void _stockbottommodal(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      elevation: 2.0,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          builder: (_, controller) => Container(
            color: Color(0xFF232338),
            child: ListView(
              controller: controller,
              padding: EdgeInsets.all(32),
              children: [
                buildText('Date'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    prefixIcon: Icon(
                      Icons.date_range_rounded,
                      color: Colors.white,
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Product Id'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Product Name'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Vendor'),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Quantitiy'),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            return TextField(
                              decoration: InputDecoration(
                                
                                hintText: state.counterValue.toString(),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                contentPadding: EdgeInsets.all(10.0),
                                filled: true,
                                fillColor: Colors.grey,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 2, 2, 2),
                                      width: 2.0),
                                ),
                              ),
                              cursorHeight: 30,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              toolbarOptions: ToolbarOptions(selectAll: true),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 164, 194, 15),
                          ),
                        ),
                        onPressed: ()=>context.read<CounterBloc>().add(DecrementEvent()),
                        child: Icon(Icons.exposure_minus_1),
                      ),
                      ElevatedButton(
                        onPressed: () =>context.read<CounterBloc>().add(IncrementEvent()),
                        child: Icon(Icons.add),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 15, 171),
                          ),
                        ),
                      ),
                    ]),
                buildText('Parchase Prize'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Selling Price'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                buildText('Discount'),
                const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                  cursorHeight: 30,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  toolbarOptions: ToolbarOptions(selectAll: true),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('close'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 171, 47, 47),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Widget buildText(String text) => Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
      ),
    );
