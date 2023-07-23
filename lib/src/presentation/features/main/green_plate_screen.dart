import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/main/views/categories_screen.dart';
import 'package:green_plate/src/presentation/features/main/views/home_screen.dart';
import 'package:green_plate/src/presentation/features/main/views/stores_screen.dart';

class GreenPlateScreen extends StatefulWidget {
  const GreenPlateScreen({super.key});

  @override
  State<GreenPlateScreen> createState() => _GreenPlateScreenState();
}

class _GreenPlateScreenState extends State<GreenPlateScreen> {
  final List<Widget> _children = const [
    HomeScreen(),
    CategoriesScreen(),
    StoresScreen(),
    HomeScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _currentIndex = 0;
  String _title = 'Green Plate';
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
      bottomNavigationBar: Container(
        height: 95,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(61, 0, 0, 1), blurRadius: 7, offset: Offset(0, 2), spreadRadius: 0)
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {
              onTabTapped(0);
            },
            child: CircleAvatar(
              radius: 28,
              backgroundColor: _getAvatarBGColor(0),
              child: Icon(
                Icons.home_outlined,
                size: 28,
                color: _getAvatarIconColor(0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTabTapped(1),
            child: CircleAvatar(
              backgroundColor: _getAvatarBGColor(1),
              radius: 28,
              child: Icon(
                Icons.dashboard_outlined,
                size: 28,
                color: _getAvatarIconColor(1),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTabTapped(2),
            child: CircleAvatar(
              backgroundColor: _getAvatarBGColor(2),
              radius: 28,
              child: Icon(
                Icons.storefront_outlined,
                size: 28,
                color: _getAvatarIconColor(2),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTabTapped(3),
            child: CircleAvatar(
              backgroundColor: _getAvatarBGColor(3),
              radius: 28,
              child: Icon(
                Icons.local_mall_outlined,
                size: 28,
                color: _getAvatarIconColor(3),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTabTapped(4),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: _getAvatarBGColor(4),
              child: Icon(
                Icons.menu_rounded,
                size: 28,
                color: _getAvatarIconColor(4),
              ),
            ),
          ),
        ]),
      ),
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
        case 1:
          _title = 'Categorias';
          break;
        case 2:
          _title = 'Lojas';
          break;
      }
    });
  }

  Color _getAvatarBGColor(int index) {
    return _currentIndex == index ? ThemeColors.primary : Colors.transparent;
  }

  Color _getAvatarIconColor(int index) {
    return _currentIndex == index ? Colors.white : ThemeColors.primaryFontColor;
  }
}
