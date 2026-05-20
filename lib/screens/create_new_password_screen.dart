import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/splash_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _isVisible = false;

  void _showSuccessDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.circle),
                child: const Icon(Icons.check_rounded, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 32),
              const Text("Success!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text(
                "Your password has been reset. You'll be redirected shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              CircularProgressIndicator(color: colorScheme.primary),
            ],
          ),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildField("New Password"),
            const SizedBox(height: 20),
            _buildField("Confirm Password"),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: _showSuccessDialog,
              child: const Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String hint) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
        obscureText: !_isVisible,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(_isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey),
            onPressed: () => setState(() => _isVisible = !_isVisible),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
