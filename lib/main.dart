import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salon_booking_app/providers/booking_provider.dart';
import 'package:salon_booking_app/screens/home_screen.dart';
import 'package:salon_booking_app/screens/splash_screen.dart';
import 'package:salon_booking_app/screens/inbox_screen.dart';
import 'package:salon_booking_app/screens/profile_screen.dart';
import 'package:salon_booking_app/screens/services_screen.dart';
import 'package:salon_booking_app/screens/gallery_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aura Bloom',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.playfairDisplayTextTheme().copyWith(
          bodyLarge: GoogleFonts.latoTextTheme().bodyLarge,
          bodyMedium: GoogleFonts.latoTextTheme().bodyMedium,
          labelLarge: GoogleFonts.latoTextTheme().labelLarge,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF480177),
          primary: const Color(0xFF480177),
          secondary: const Color(0xFFA855F7),
          tertiary: const Color(0xFFFDE047),
          surface: const Color(0xFFFDFCFE),
        ),
        scaffoldBackgroundColor: const Color(0xFFFDFCFE),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFDFCFE),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.playfairDisplay(
            color: const Color(0xFF480177),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF480177),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            textStyle: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.playfairDisplayTextTheme(ThemeData.dark().textTheme).copyWith(
          bodyLarge: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).bodyLarge,
          bodyMedium: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).bodyMedium,
          labelLarge: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).labelLarge,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFA855F7),
          secondary: Color(0xFFFDE047),
          surface: Color(0xFF120121),
        ),
        scaffoldBackgroundColor: Color(0xFF120121),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF120121),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
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

  final List<Widget> _screens = [
    const HomeScreen(),
    const ServicesScreen(),
    const GalleryScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_outlined),
              activeIcon: Icon(Icons.auto_awesome),
              label: "Services",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_outlined),
              activeIcon: Icon(Icons.collections),
              label: "Gallery",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              activeIcon: Icon(Icons.chat_bubble_rounded),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
