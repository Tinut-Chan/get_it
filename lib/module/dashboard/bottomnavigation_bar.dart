import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key, required this.child});
  final Widget child;

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

bool isActive = false;

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (index) {
            _onItemTapped(index, context);
          },
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              // activeIcon: Icon(CupertinoIcons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                // activeIcon: Icon(CupertinoIcons.settings, color: Colors.blue),
                label: 'QR Scan'),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        (context).go('/');
        break;
      case 1:
        context.go('/personal-profile');
        break;
    }
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location == "/") {
      isActive = false;
      return 0;
    }
    if (location == '/personal-profile') {
      isActive = false;
      return 1;
    }
    return 0;
  }
}
