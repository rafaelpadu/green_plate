import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/main/home/view/home_screen.dart';

class GreenPlateScreen extends StatefulWidget {
  const GreenPlateScreen({super.key});

  @override
  State<GreenPlateScreen> createState() => _GreenPlateScreenState();
}

class _GreenPlateScreenState extends State<GreenPlateScreen> {
  final List<Widget> _children = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _currentIndex = 0;
  String _title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.notifications_outlined),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedIconTheme: IconThemeData(color: ThemeColors.primary),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 28,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_mall_outlined,
                  size: 28,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_rounded,
                  size: 28,
                ),
                label: ''),
          ]),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Green Plate';
          break;
      }
    });
  }
}
