import 'package:cashloan_module/main.dart';
import 'package:cashloan_module/page/news/news_page.dart';
import 'package:config/injector/injector.dart';
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
    RaisedButton(
      onPressed: () {
        InjectorContainer()
            .getNavigationKeyService()
            .navigateToNamed(NewsPage.PATH);
      },
      child: Text("Daftar"),
    ),
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
