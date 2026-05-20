import 'package:flutter/material.dart';
import '../booking/salon_details_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Services"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildCategory(context, "Hair Artistry", Icons.content_cut_rounded, [
            "Haircut & Styling",
            "Color Transformation",
            "Scalp Treatment",
            "Premium Blowout",
          ]),
          const SizedBox(height: 24),
          _buildCategory(context, "Skin & Facial", Icons.face_retouching_natural_rounded, [
            "HydraFacial Luxury",
            "Anti-Aging Therapy",
            "Oxygen Infusion",
          ]),
          const SizedBox(height: 24),
          _buildCategory(context, "Spa & Wellness", Icons.spa_rounded, [
            "Deep Tissue Massage",
            "Aromatherapy",
            "Hot Stone Therapy",
          ]),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, IconData icon, List<String> services) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: colorScheme.primary),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
            ],
          ),
          child: Column(
            children: services.asMap().entries.map((entry) {
              final bool isLast = entry.key == services.length - 1;
              return Column(
                children: [
                  ListTile(
                    title: Text(entry.value),
                    trailing: Icon(Icons.chevron_right, color: colorScheme.primary.withValues(alpha: 0.3)),
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SalonDetailsScreen(salonName: "Aura Bloom"),
                        ),
                      );
                    },
                  ),
                  if (!isLast) Divider(indent: 16, endIndent: 16, color: Colors.grey[100]),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
