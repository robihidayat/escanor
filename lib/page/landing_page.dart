

import 'package:escanor/commons/utils/constans_color.dart';
import 'package:escanor/model/user_principle.dart';
import 'package:escanor/page/home_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  final UserPrinciple name;
    LandingPage({Key key, @required this.name}) : super(key: key);


  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
    new HomeScreen(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: _buildBottomNavigation()
    );
  }

  Widget _buildBottomNavigation(){
  return new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: ConstantColors.green,
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            title: new Text(
              'Beranda',
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.assignment,
              color: ConstantColors.green,
            ),
            icon: new Icon(
              Icons.assignment,
              color: Colors.grey,
            ),
            title: new Text('Status'),
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.mail,
              color: ConstantColors.green,
            ),
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            ),
            title: new Text('Invitation'),
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.person,
              color: ConstantColors.green,
            ),
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            ),
            title: new Text('Profile'),
          ),
        ],
      );
  }
}
