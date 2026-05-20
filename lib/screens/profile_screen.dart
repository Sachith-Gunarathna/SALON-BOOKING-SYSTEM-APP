import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/edit_profile_screen.dart';
import 'package:salon_booking_app/screens/notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Image and Name
            const Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFF480177),
                          child: Icon(Icons.edit, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Sachith Lakshan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "sachith@example.com",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Settings List
            _buildProfileItem(context, Icons.person_outline, "Edit Profile", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
            }),
            _buildProfileItem(context, Icons.notifications_none, "Notification", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
            }),
            _buildProfileItem(context, Icons.payment_outlined, "Payment"),
            _buildProfileItem(context, Icons.security_outlined, "Security"),
            _buildProfileItem(context, Icons.language_outlined, "Language", trailingText: "English (US)"),
            _buildProfileItem(context, Icons.visibility_outlined, "Dark Mode", isSwitch: true),
            _buildProfileItem(context, Icons.help_outline, "Help Center"),
            _buildProfileItem(context, Icons.people_outline, "Invite Friends"),
            _buildProfileItem(context, Icons.logout, "Logout", textColor: Colors.red, iconColor: Colors.red),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title, {String? trailingText, bool isSwitch = false, Color? textColor, Color? iconColor, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor ?? Colors.black,
        ),
      ),
      trailing: isSwitch
          ? Switch(value: false, onChanged: (v) {}, activeThumbColor: const Color(0xFF480177))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trailingText != null)
                  Text(trailingText, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                const Icon(Icons.chevron_right, color: Colors.black),
              ],
            ),
      onTap: onTap ?? () {},
    );
  }
}
