import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:electro_calculation/main_app_bar.dart';
import 'package:electro_calculation/page2_gridview.dart';
import 'package:electro_calculation/page3_listview.dart';
import 'package:electro_calculation/resistor_gridview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  List<Widget> pages = [
    ResistorGridView(),
    PageTwoGridView(),
    PageThreeListView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: MainAppBar(
          title: Text('Electro Calculations', style: TextStyle(color: Colors.white, fontSize: 28,fontWeight: FontWeight.w700),),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white54,
          color: Colors.deepOrange,
          animationCurve: Curves.decelerate,
          items: <Widget>[
            Icon(Icons.code, size: 30, color: Colors.white),
            Icon(Icons.architecture_sharp, size: 30, color: Colors.white),
            Icon(Icons.list, size: 30,color: Colors.white),
          ],
          onTap: _onItemTapped,
        )
      );
    }
  }

