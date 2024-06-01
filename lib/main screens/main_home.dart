import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gagna/main%20screens/screens/feeds/feeds.dart';
import 'package:gagna/main%20screens/screens/home/home.dart';
import 'package:gagna/main%20screens/screens/portfolio/portfolio.dart';
import 'package:gagna/main%20screens/screens/profile.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;
  List<Widget> _body = [
    HomeScreen(),
    FeedsScreen(),
    PortfolioScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff005E5E),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
          onTap: (int newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                activeIcon: SvgPicture.asset('assets/home-2b.svg'),
                icon: SvgPicture.asset('assets/home-2.svg')
            ),
            BottomNavigationBarItem(
                label: 'Feeds',
                activeIcon: SvgPicture.asset('assets/activityb.svg'),
                icon: SvgPicture.asset('assets/activity.svg')
            ),
            BottomNavigationBarItem(
                label: 'Portfolio',
                activeIcon: SvgPicture.asset('assets/graphb.svg'),
                icon: SvgPicture.asset('assets/graph.svg')
            ),
            BottomNavigationBarItem(
                label: 'Profile',
                activeIcon: SvgPicture.asset('assets/profile-remove.svg'),
                icon: SvgPicture.asset('assets/profile.svg')
            ),
          ]
      ),
    );
  }
}
