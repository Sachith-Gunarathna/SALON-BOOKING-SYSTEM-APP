import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/salon_details_screen.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String categoryName;

  // අපි මේ පේජ් එකට එද්දී Category එකේ නම (උදා: "Haircuts") අරගෙන එනවා
  const CategoryDetailsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryName, // මෙතනට "Haircuts" කියලා වැටෙනවා
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 1. Search Bar එක
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Container(
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
                  suffixIcon: const Icon(Icons.tune, color: Color(0xFF480177)), // Filter Icon
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),

          // 2. Salon List එක
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                _buildSalonCard(
                  context: context,
                  name: "Belle Curls",
                  address: "0993 Novick Parkway",
                  distance: "1.2 km",
                  rating: "4.8",
                  isBookmarked: true,
                ),
                _buildSalonCard(
                  context: context,
                  name: "Pretty Parlor",
                  address: "7 Doe Crossing Pass",
                  distance: "2.1 km",
                  rating: "4.9",
                  isBookmarked: false,
                ),
                _buildSalonCard(
                  context: context,
                  name: "That's Cut!",
                  address: "883 Jackson Hill",
                  distance: "8.4 km",
                  rating: "4.1",
                  isBookmarked: false,
                ),
                _buildSalonCard(
                  context: context,
                  name: "Ace of Fades",
                  address: "3 Clyde Gallagher Road",
                  distance: "3.2 km",
                  rating: "4.6",
                  isBookmarked: true,
                ),
                _buildSalonCard(
                  context: context,
                  name: "Hair Don't Fade",
                  address: "982 Linden Trail",
                  distance: "4.4 km",
                  rating: "4.7",
                  isBookmarked: false,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalonCard({
    required BuildContext context,
    required String name,
    required String address,
    required String distance,
    required String rating,
    required bool isBookmarked,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SalonDetailsScreen(salonName: name),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.08),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // පින්තූරය තියෙන කොටුව
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
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    address,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF480177), size: 16),
                      const SizedBox(width: 4),
                      Text(distance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(width: 16),
                      const Icon(Icons.star_half, color: Color(0xFF480177), size: 16),
                      const SizedBox(width: 4),
                      Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),

            // Bookmark Icon එක (Fill කරපු එකද, Outline එකද කියලා තීරණය කරනවා)
            IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: const Color(0xFF480177),
                size: 28,
              ),
              onPressed: () {
                // Bookmark එක වෙනස් කරන Action එක
              },
            ),
          ],
        ),
      ),
    );
  }
}