import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fugipie_inventory/componants/stocklist.dart';
import 'package:fugipie_inventory/screens/history.dart';
import '../screens/homepagebody.dart';
import '../screens/stock.dart';
import '../screens/sales.dart';
import '../screens/service.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);
  static MaterialPage page() =>const MaterialPage(child: HomeRoute());


  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Screens = [
    HomePageBody(),
    StockList(),
    SalesPage(),
    ServicePage(),
    HistoryPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: IndexedStack(
          index: _selectedIndex,
          children: Screens,
        ),
        bottomNavigationBar: Container(
          // color: Colors.blueAccent,
          height: 80.0,
          child: BottomNavigationBar(
            backgroundColor: Color(0xff181826),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // backgroundColor: Color(0xff181826),
                icon: const Icon(
                  Icons.home_outlined,
                  size: 35.0,
                ),
                label: '',
                activeIcon: Container(
                  height: 50.0,
                  width: 50.0,
                  //color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.blueAccent,
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    size: 35.0,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                // backgroundColor: Color(0xff181826),
                icon: const Icon(
                  CupertinoIcons.tags,
                  size: 30.0,
                ),
                label: '',
                activeIcon: Container(
                  height: 50.0,
                  width: 50.0,
                  //color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    CupertinoIcons.tags,
                    size: 28.0,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                // backgroundColor: Color(0xff181826),
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                ),
                label: '',
                activeIcon: Container(
                  height: 50.0,
                  width: 50.0,
                  //color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 28.0,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                // backgroundColor: Color(0xff181826),
                icon: const Icon(
                  CupertinoIcons.hammer,
                  size: 30.0,
                ),
                label: '',
                activeIcon: Container(
                  height: 50.0,
                  width: 50.0,
                  //color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    CupertinoIcons.hammer,
                    size: 28.0,
                  ),
                ),
                
              ),
              BottomNavigationBarItem(
                // backgroundColor: Color(0xff181826),
                icon: const Icon(
                  Icons.insert_chart_outlined_sharp,
                  size: 30.0,
                ),
                label: '',
                activeIcon: Container(
                  height: 50.0,
                  width: 50.0,
                  //color: Colors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    Icons.insert_chart_outlined_sharp,
                    size: 35.0,
                  ),
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
