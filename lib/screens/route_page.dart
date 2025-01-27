import 'package:flutter/material.dart';
import 'package:seezntv/screens/home_page.dart';
import 'package:seezntv/screens/search_page.dart';
import 'package:seezntv/screens/downloads_page.dart';
import 'package:seezntv/screens/profile_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _selectedNavIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const DownloadsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 43, 1),
      body: IndexedStack(
        index: _selectedNavIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(37, 40, 54, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', _selectedNavIndex == 0, 0),
            _buildNavItem(Icons.search, 'Search', _selectedNavIndex == 1, 1),
            _buildNavItem(Icons.file_download_outlined, 'Download',
                _selectedNavIndex == 2, 2),
            _buildNavItem(Icons.person, 'Profile', _selectedNavIndex == 3, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, int index) {
    final color = Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 26,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
