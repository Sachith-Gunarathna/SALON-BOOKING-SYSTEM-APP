import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import '../communication/notification_screen.dart';
import 'appointments_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: colorScheme.primary, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, size: 60, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.tertiary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit, color: colorScheme.primary, size: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Sachith Lakshan",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "sachith@aura-bloom.com",
                    style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat(context, "12", "Bookings"),
                  _buildStat(context, "450", "Points"),
                  _buildStat(context, "Gold", "Member"),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Menu Items
            _buildProfileItem(context, Icons.history_rounded, "Appointment History", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentsScreen()));
            }),
            _buildProfileItem(context, Icons.person_outline_rounded, "Personal Details", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
            }),
            _buildProfileItem(context, Icons.notifications_none_rounded, "Notifications", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
            }),
            _buildProfileItem(context, Icons.card_membership_rounded, "Loyalty & Rewards"),
            _buildProfileItem(context, Icons.payment_rounded, "Payment Methods"),
            const Divider(indent: 24, endIndent: 24, height: 40),
            _buildProfileItem(context, Icons.help_outline_rounded, "Help Center"),
            _buildProfileItem(context, Icons.privacy_tip_outlined, "Privacy Policy"),
            _buildProfileItem(context, Icons.logout_rounded, "Logout", textColor: Colors.red, iconColor: Colors.red),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 12)),
      ],
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title, {Color? textColor, Color? iconColor, VoidCallback? onTap}) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Icon(icon, color: iconColor ?? colorScheme.primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor ?? colorScheme.onSurface,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, size: 20),
      onTap: onTap ?? () {},
    );
  }
}
