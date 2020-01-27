import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Menu> {
  int _currentIndex = 0;

  final List<Widget> widgetList = <Widget>[
    Text("Home"),
    Text("Order"),
    Text("Kasbon"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("Order")),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), title: Text("Kasbon")),
        ],
      ),
      body: Center(
        child: widgetList[_currentIndex],
      ),
    );
  }
}
