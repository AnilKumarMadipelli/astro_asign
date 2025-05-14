import 'package:assignment/utils/custom_image.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      selectedFontSize: 16,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: CustomImage(
            assetPath: 'assets/signs/Home.svg',
            height: 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomImage(
            assetPath: 'assets/signs/course.svg',
            height: 30,
          ),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: CustomImage(
            assetPath: 'assets/signs/course (1).svg',
            height: 30,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: CustomImage(
            assetPath: 'assets/signs/User Profile.svg',
            height: 30,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
