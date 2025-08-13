import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;
  const BottomNav({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      elevation: 0,
      backgroundColor: Colors.transparent,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueAccent,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud_upload),
          label: 'Backup',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
