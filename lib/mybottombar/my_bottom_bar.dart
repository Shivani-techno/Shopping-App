import 'package:ecommerceapp/appColors/app_colors.dart';
import 'package:ecommerceapp/screens/category/category_screen.dart';
import 'package:ecommerceapp/screens/homepage/home_page.dart';
import 'package:ecommerceapp/screens/wishlist/wish_list_screen.dart';
import 'package:ecommerceapp/screens/yourbag/your_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_top_navigator/custom_scaffold.dart';

import '../screens/profilescreen/profile_screen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const CategoryScreenState(),
    const YourBagScreen(),
    const WishListScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onItemTap: _onItemTapped,
      scaffold: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffE3F6FF),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: const Color(0xff567189),
          selectedIconTheme:
              const IconThemeData(color: AppColors.baseDarkPinkColor),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.baseDarkPinkColor,
          onTap: _onItemTapped,
        ),
      ),
      children: _widgetOptions,
    );
  }
}
