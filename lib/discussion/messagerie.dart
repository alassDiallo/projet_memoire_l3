import 'package:flutter/material.dart';
import 'discussion.dart';

class Messagerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Discussion(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey.shade100,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "messages"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "groupe"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "profil"),
      ],
    );
  }
}
