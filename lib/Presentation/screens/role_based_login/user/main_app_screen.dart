import 'package:e_commerce_app/Presentation/screens/role_based_login/user/app_home_screen.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  final List pages = [
    AppHomeScreen(),
    Center(child: Text('Explore')),
    Center(child: Text('Notification')),
    Center(child: Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.kWhite,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: ColorsConst.kBlack,
        unselectedItemColor: ColorsConst.kGrey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsConst.kWhite,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Profile'),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
