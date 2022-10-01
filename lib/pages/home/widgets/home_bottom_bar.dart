import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeBottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) updateCurrentIndex;
  const HomeBottomBar({
    Key? key,
    required this.currentIndex,
    required this.updateCurrentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1A0B43),
      padding: EdgeInsets.only(bottom: 16, top: 8),
      child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            updateCurrentIndex(value);
          },
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Color(0xff1A0B43),
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1A0B43),
              icon: Image.asset(
                'assets/home.png',
                color: currentIndex == 0 ? Colors.white : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1A0B43),
              icon: Image.asset(
                'assets/charts.png',
                color: currentIndex == 1 ? Colors.white : Colors.grey,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1A0B43),
              icon: Image.asset(
                'assets/wallet.png',
                color: currentIndex == 2 ? Colors.white : Colors.grey,
              ),
              label: 'Wallets',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1A0B43),
              icon: Image.asset(
                'assets/settings.png',
                color: currentIndex == 3 ? Colors.white : Colors.grey,
              ),
              label: 'Settings',
            ),
          ]),
    );
  }
}
