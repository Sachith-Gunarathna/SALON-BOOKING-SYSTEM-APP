import 'package:flutter/material.dart';

class MyBookmarkScreen extends StatefulWidget {
  const MyBookmarkScreen({super.key});

  @override
  State<MyBookmarkScreen> createState() => _MyBookmarkScreenState();
}

class _MyBookmarkScreenState extends State<MyBookmarkScreen> {
  String _selectedCategory = "All";
  final List<String> _categories = ["All", "Haircuts", "Make up", "Manicure", "Massage"];

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
        title: const Text(
          "My Bookmark",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: const Icon(Icons.more_horiz, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // Filter Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: _categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: _buildCategoryChip(category),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Bookmark List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: [
                _buildBookmarkCard(
                  name: "Belle Curls",
                  address: "0993 Novick Parkway",
                  distance: "1.2 km",
                  rating: "4.8",
                ),
                _buildBookmarkCard(
                  name: "Serenity Salon",
                  address: "88 Commercial Plaza",
                  distance: "4.2 km",
                  rating: "4.0",
                ),
                _buildBookmarkCard(
                  name: "Serenity Salon",
                  address: "9 Evergreen Drive",
                  distance: "2.3 km",
                  rating: "4.7",
                ),
                _buildBookmarkCard(
                  name: "Serenity Salon",
                  address: "65220 Holy Cross Pass",
                  distance: "3.6 km",
                  rating: "4.6",
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF99000) : Colors.white,
          border: Border.all(color: const Color(0xFFF99000), width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFF99000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBookmarkCard({
    required String name,
    required String address,
    required String distance,
    required String rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(address, style: TextStyle(color: Colors.grey[600], fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xFFF99000), size: 16),
                    const SizedBox(width: 4),
                    Text(distance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(width: 16),
                    const Icon(Icons.star_half, color: Color(0xFFF99000), size: 16),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Color(0xFFF99000), size: 28),
            onPressed: () {
              // මෙතනින් තමයි යටින් එන Popup එක Call කරන්නේ
              _showRemoveBookmarkBottomSheet(context, name, address, distance, rating);
            },
          ),
        ],
      ),
    );
  }

  // අලුතින් එකතු කරපු Bottom Sheet එකේ Function එක
  void _showRemoveBookmarkBottomSheet(BuildContext context, String name, String address, String distance, String rating) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)), // උඩ කොන් දෙක රවුම් කරනවා
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // ඇතුලේ තියෙන දේවල් වල සයිස් එකට විතරක් ලොකු වෙන්න
            children: [
              const Text(
                "Remove from Bookmark?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 24),

              // ඇතුලෙ පෙන්නන සැලෝන් කාඩ් එක
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.08), spreadRadius: 2, blurRadius: 15, offset: const Offset(0, 5)),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
                      child: const Icon(Icons.store, color: Colors.grey, size: 40),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(address, style: TextStyle(color: Colors.grey[600], fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Color(0xFFF99000), size: 16),
                              const SizedBox(width: 4),
                              Text(distance, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              const SizedBox(width: 16),
                              const Icon(Icons.star_half, color: Color(0xFFF99000), size: 16),
                              const SizedBox(width: 4),
                              Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.bookmark, color: Color(0xFFF99000), size: 28),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Cancel සහ Remove බටන් දෙක
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context), // Popup එක වහන්න
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFF4E5), // ලා තැඹිලි පාට (Cancel බටන් එක)
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                      ),
                      child: const Text("Cancel", style: TextStyle(color: Color(0xFFF99000), fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // මෙතනට Bookmark එකෙන් අයින් කරන Logic එක දාන්න පුළුවන්
                        Navigator.pop(context);
                        print("$name Removed from bookmarks");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF99000),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                      ),
                      child: const Text("Yes, Remove", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}