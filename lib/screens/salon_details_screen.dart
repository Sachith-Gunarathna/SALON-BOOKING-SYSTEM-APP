import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/booking_screen.dart';

class SalonDetailsScreen extends StatelessWidget {
  final String salonName;

  const SalonDetailsScreen({super.key, required this.salonName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[200],
                child: const Icon(Icons.store, size: 100, color: Colors.grey),
              ),
            ),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.share, color: Colors.black),
                ),
                onPressed: () {},
              ),
            ],
          ),

          // 2. Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF480177),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Barbershop",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
                          SizedBox(width: 4),
                          Text(
                            "4.8 (1.2k reviews)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    salonName,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF480177), size: 20),
                      const SizedBox(width: 4),
                      Text("0993 Novick Parkway", style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tabs Placeholder (About, Services, Package, Review)
                  DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        const TabBar(
                          isScrollable: true,
                          labelColor: Color(0xFF480177),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color(0xFF480177),
                          tabs: [
                            Tab(text: "About"),
                            Tab(text: "Services"),
                            Tab(text: "Package"),
                            Tab(text: "Review"),
                          ],
                        ),
                        SizedBox(
                          height: 400,
                          child: TabBarView(
                            children: [
                              // About
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                  style: TextStyle(height: 1.5),
                                ),
                              ),
                              // Services
                              ListView(
                                children: [
                                  _buildServiceItem("Haircut", "\$25.00"),
                                  _buildServiceItem("Shaving", "\$15.00"),
                                  _buildServiceItem("Hair Coloring", "\$50.00"),
                                ],
                              ),
                              const Center(child: Text("Packages")),
                              const Center(child: Text("Reviews")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(salonName: salonName),
              ),
            );
          },
          child: const Text("Book Now", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildServiceItem(String title, String price) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: const Text("45 mins"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(price, style: const TextStyle(color: Color(0xFF480177), fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          const Icon(Icons.radio_button_off, color: Color(0xFF480177)),
        ],
      ),
    );
  }
}
