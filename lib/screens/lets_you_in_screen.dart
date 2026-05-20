import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/signin_screen.dart';
import 'package:salon_booking_app/screens/signup_screen.dart';

class LetsYouInScreen extends StatelessWidget {
  const LetsYouInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Hero(
                tag: 'app_logo',
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                "Experience Luxury",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Welcome to Aura Bloom. Sign in to access our exclusive services.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 48),

              _buildSocialButton(Icons.g_mobiledata, "Continue with Google", () {}),
              const SizedBox(height: 16),
              _buildSocialButton(Icons.apple, "Continue with Apple", () {}),
              
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[200])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("or", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[200])),
                ],
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text("Sign in with Password"),
              ),
              
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to Aura Bloom? ", style: TextStyle(color: Colors.grey[600])),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String text, VoidCallback onPressed) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[200]!),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.black),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
