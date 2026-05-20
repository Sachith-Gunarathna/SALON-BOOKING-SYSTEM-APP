import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/lets_you_in_screen.dart';
// අපි ඊළඟට යන්න ඕන පේජ් එක මෙතනට Import කරගන්නවා

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // තත්පර 3කින් ඔටෝමැටික් ඊළඟ පේජ් එකට යන ෆන්ක්ෂන් එක
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    // Mount වෙලාද කියලා චෙක් කරලා තමයි Navigate කරන්නේ (Error එන එක නවත්වන්න)
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LetsYouInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF480177), // Deep Purple Background
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // ලෝගෝ අකුර (C)
            const Text(
              "C",
              style: TextStyle(
                fontSize: 140,
                color: Colors.white,
                fontFamily: 'cursive', // අකුරේ හැඩය ලස්සන කරන්න
                fontStyle: FontStyle.italic,
              ),
            ),

            const Spacer(),

            // යටින් තියෙන Loading Indicator එක
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 60), // යටින් තියෙන ඉඩ ප්‍රමාණය
          ],
        ),
      ),
    );
  }
}