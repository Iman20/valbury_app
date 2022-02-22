import 'package:flutter/material.dart';
import 'package:valbury_test/home_page.dart';

class BaseNavigationPage extends StatefulWidget {
  const BaseNavigationPage({ Key? key }) : super(key: key);

  @override
  _BaseNavigationPageState createState() => _BaseNavigationPageState();
}

class _BaseNavigationPageState extends State<BaseNavigationPage> {

  int _selectedIdx = 0;

  static const List<Widget> _widgetOptions = <Widget>[
   HomePage(),
    Text(
      'RS',
    ),
    Text(
      'Klinik',
    ),
    Text(
      'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIdx)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'HOME'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing_outlined),
            label: 'RS'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'KLINIK'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'PROFILE'
          ),
        ],
        currentIndex: _selectedIdx,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[100],
        onTap: _onItemTapped,
      ),
      
    );
  }
}