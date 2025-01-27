import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seezntv/assets_model/assets_model.dart';
import 'package:seezntv/screens/notification_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildProfileSection(context),
            const SizedBox(height: 24),
            _buildPremiumCard(context),
            const SizedBox(height: 24),
            _buildSection(context, 'Account', [
              _buildMenuItem(
                Icons.person,
                'Member',
                onTap: () {},
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                Icons.lock_outline,
                'Change Password',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'General', [
              _buildMenuItem(
                Icons.notifications,
                'Notification',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()),
                  );
                },
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                Icons.language,
                'Language',
                onTap: () {
                  Navigator.pushNamed(context, '/language-page');
                },
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                Icons.flag,
                'Country',
                onTap: () {},
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                CupertinoIcons.delete,
                'Clear Cache',
                onTap: () {
                  // Clear cache logic here
                },
              ),
            ]),
            const SizedBox(height: 24),
            _buildSection(context, 'More', [
              _buildMenuItem(
                Icons.security,
                'Legal and Policies',
                onTap: () {},
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                Icons.help,
                'Help & Feedback',
                onTap: () {},
              ),
              const Divider(height: 2, color: Color.fromRGBO(68, 78, 97, 1)),
              _buildMenuItem(
                Icons.info,
                'About Us',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 32),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Profile',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> items) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: const Color.fromRGBO(68, 78, 97, 1)),
        color: Color.fromRGBO(31, 29, 43, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...items,
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: const Color.fromRGBO(68, 78, 97, 1)),
        color: const Color(0xFF252836),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF14D3D), width: 2),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AssetsModel.profile),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tiffany',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tiffanyjearsey@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/edit-profile-page'),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1D2B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.edit_square,
                color: Color(0xFFF14D3D),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1D2B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF252836),
              ),
              child: Icon(icon, color: Colors.grey, size: 20),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFFF14D3D),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/premium-page'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFD8724),
              Color(0xFFFD9D3F),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFD9E41),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.workspace_premium, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Premium Member',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'New movies are coming for you,\nDownload Now!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogOutDialog(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF252836),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetsModel.logOut,
              width: 130,
            ),
            const SizedBox(height: 24),
            const Text(
              'Are you sure ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ullamcorper imperdiet urna id non sed est\nsem. Rhoncus amet, enim purus gravida\ndonec aliquet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFF14D3D)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Color(0xFFF14D3D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(41, 205, 216, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: _buildLogOutDialog(context),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: const Color(0xFF12CDD9)),
        ),
        child: const Text(
          'Log Out',
          style: TextStyle(
            color: Color(0xFF12CDD9),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
