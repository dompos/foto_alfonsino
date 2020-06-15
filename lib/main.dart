import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fotoalfonsino/Users.dart';
import 'Photos.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  int _selectedIndex = 0;//indice di pagina

  static List<Widget> _widgetOptions = <Widget>[
    Photos(),
    Users(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
}//_onItemTapped

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'foto alfonsino',
      home: Scaffold(

        body: _widgetOptions.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.photo),
                title: Text('Photos')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Users'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Color(0xfffabe00),
          unselectedItemColor: Colors.white70,
          backgroundColor: Color(0xff232426),
        ),
      ),
    );
  }
}

