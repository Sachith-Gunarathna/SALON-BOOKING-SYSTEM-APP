import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon_booking_app/providers/booking_provider.dart';
import 'package:salon_booking_app/screens/booking_screen.dart';

class SalonDetailsScreen extends StatelessWidget {
  final String salonName;

  const SalonDetailsScreen({super.key, required this.salonName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1. Premium App Bar
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                salonName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 10)],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.secondary],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome_rounded, size: 100, color: colorScheme.tertiary),
                      const SizedBox(height: 16),
                      const Text(
                        "THE ART OF BEAUTY",
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 4,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // 2. Salon Information
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Exclusive Boutique Salon",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star_rounded, color: colorScheme.tertiary, size: 24),
                              const SizedBox(width: 4),
                              const Text("4.9", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              const Text("(2.4k+ Reviews)", style: TextStyle(color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.location_on_rounded, color: colorScheme.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // About Section
                  const Text("About Aura Bloom", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    "Discover the ultimate sanctuary of beauty and relaxation. Aura Bloom offers a personalized luxury experience with world-class stylists and premium botanical products.",
                    style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.7), height: 1.6),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Featured Services
                  const Text("Signature Services", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildServiceItem(context, "Royal Hair Spa", 120.0, "90 min"),
                  _buildServiceItem(context, "Golden Glow Facial", 95.0, "60 min"),
                  _buildServiceItem(context, "Artisan Styling", 65.0, "45 min"),
                  
                  const SizedBox(height: 32),
                  
                  // Gallery Preview Placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Gallery", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: Text("View All", style: TextStyle(color: colorScheme.primary))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.image, color: Colors.white24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
          ],
        ),
        child: Consumer<BookingProvider>(
          builder: (context, provider, child) {
            return ElevatedButton(
              onPressed: provider.selectedServiceName != null ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(salonName: salonName),
                  ),
                );
              } : null,
              child: Text(
                provider.selectedServiceName != null 
                    ? "Book ${provider.selectedServiceName}" 
                    : "Select a Service", 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String name, double price, String duration) {
    final colorScheme = Theme.of(context).colorScheme;
    final bookingProvider = Provider.of<BookingProvider>(context);
    final bool isSelected = bookingProvider.selectedServiceName == name;

    return GestureDetector(
      onTap: () {
        bookingProvider.selectService(name, price);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary.withValues(alpha: 0.05) : colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.primary.withValues(alpha: 0.05),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(duration, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
            Row(
              children: [
                Text("\$${price.toStringAsFixed(0)}", style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Icon(
                  isSelected ? Icons.check_circle_rounded : Icons.radio_button_off_rounded,
                  color: colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
