import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/category_details_screen.dart';
import 'package:salon_booking_app/screens/salon_details_screen.dart';
import 'package:salon_booking_app/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. App Bar Area (Logo & Icons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF480177),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "C",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Casca",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationScreen()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),

              // 2. Greeting
              const Text(
                "Morning, Sachith 👋",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 24),

              // 3. Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    suffixIcon: Icon(Icons.tune, color: const Color(0xFF480177)), // Filter Icon
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. Promo Card (Special Offer)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB74D), Color(0xFF480177)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "30% OFF",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.stars, color: Colors.white.withValues(alpha: 0.5), size: 40),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Today's Special",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Get a discount for every service order!\nOnly valid for today!",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 5. Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem(Icons.content_cut, "Haircuts"),
                  _buildCategoryItem(Icons.face_retouching_natural, "Make up"),
                  _buildCategoryItem(Icons.back_hand, "Manicure"),
                  _buildCategoryItem(Icons.spa, "Massage"),
                ],
              ),
              const SizedBox(height: 32),

              // 6. Nearby Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nearby Your Location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All", style: TextStyle(color: Color(0xFF480177), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 7. Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip("All", isSelected: true),
                    const SizedBox(width: 12),
                    _buildChip("Haircuts"),
                    const SizedBox(width: 12),
                    _buildChip("Make up"),
                    const SizedBox(width: 12),
                    _buildChip("Manicure"),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 8. Salon List Item
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SalonDetailsScreen(salonName: "Belle Curls"),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // පින්තූරය තියෙන තැන
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.store, color: Colors.grey, size: 40),
                      ),
                      const SizedBox(width: 16),
                      // විස්තර ටික
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Belle Curls", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text("0993 Novick Parkway", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Color(0xFF480177), size: 16),
                                const SizedBox(width: 4),
                                const Text("1.2 km", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                const SizedBox(width: 16),
                                const Icon(Icons.star_half, color: Color(0xFF480177), size: 16),
                                const SizedBox(width: 4),
                                const Text("4.8", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Bookmark බටන් එක
                      IconButton(
                        icon: const Icon(Icons.bookmark, color: Color(0xFF480177)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // 9. Bottom Navigation Bar

    );
  }

  // Categories හදන Custom Widget එක
  Widget _buildCategoryItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // අයිකන් එක ක්ලික් කරාම අලුත් පේජ් එකට යනවා
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsScreen(categoryName: label),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF480177), size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        ],
      ),
    );
  }

  // Filter Chips හදන Custom Widget එක
  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF480177) : Colors.white,
        border: Border.all(color: const Color(0xFF480177)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF480177),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}