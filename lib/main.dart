import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/home_screen.dart';
import 'package:salon_booking_app/screens/my_bookmark_screen.dart';
import 'package:salon_booking_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salon Booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF99000)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // අපි යටින් ටැබ් ඔබද්දී මාරු වෙන්න ඕනේ පේජ් ටික මෙතන තියෙනවා
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Explore Screen", style: TextStyle(fontSize: 24))), // දැනට Placeholder
    const MyBookmarkScreen(), // දැනට Placeholder
    const Center(child: Text("Inbox Screen", style: TextStyle(fontSize: 24))), // දැනට Placeholder
    const Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))), // දැනට Placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex], // තෝරපු ටැබ් එකට අදාළ පේජ් එක මෙතන පෙන්නනවා

      // Bottom Navigation Bar එක සම්පූර්ණයෙන්ම තියෙන්නේ මෙතනයි
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // ටැබ් එක එබුවම ඉන්ඩෙක්ස් එක මාරු කරනවා
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF99000), // තැඹිලි පාට
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: "My Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}