import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/pages/bookmark.dart';
import 'package:movies_app/pages/home.dart';
import 'package:movies_app/pages/profile.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({super.key});

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    const BookmarkPage(),
    const ProfilePage()
  ];

  void _onTap(int index)
  {
    if (_selectedIndex == index) return;

    setState(() => _selectedIndex = index);
    _pageController.animateToPage(index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut);
  }

  @override
  void dispose()
  {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: _pages
      ),

      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withValues(alpha: 0.1),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 1),
            )
          ]
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navMenuItem(0,
              Icons.home_outlined,
              Icons.home,
              'Home'
            ),
            navMenuItem(1,
              Icons.bookmark_outline_rounded,
              Icons.bookmark_rounded,
              'Bookmark'
            ),
            navMenuItem(2,
              Icons.person,
              CupertinoIcons.profile_circled,
              'Profile'
            )
          ],
        ),
      ),
    );
  }

  // Navigation Bar Menu Item
  Widget navMenuItem(
      int index,
      IconData icon,
      IconData activeIcon,
      String label)
  {
    bool isSelected = index == _selectedIndex;
    Color itemColor = isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GestureDetector(
          onTap: () => setState(() => _onTap(index)),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey.withValues(alpha: 0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isSelected ? activeIcon : icon, color: itemColor, size: 24),
                SizedBox(height: 4),
                Text(label,
                  style: TextStyle(
                    color: itemColor,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
