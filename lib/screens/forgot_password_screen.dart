import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              height: 180, width: 180,
              decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.05), shape: BoxShape.circle),
              child: Icon(Icons.lock_reset_rounded, size: 80, color: colorScheme.primary),
            ),
            const SizedBox(height: 32),
            const Text(
              "Select recovery method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildOption(1, Icons.sms_rounded, "via SMS:", "+1 111 ******99"),
            const SizedBox(height: 16),
            _buildOption(2, Icons.email_rounded, "via Email:", "dan***in@aura-bloom.com"),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen()));
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index, IconData icon, String title, String subtitle) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isSelected = _selectedOption == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? colorScheme.primary : colorScheme.onSurface.withValues(alpha: 0.05), width: 2),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: colorScheme.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: Icon(icon, color: colorScheme.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
