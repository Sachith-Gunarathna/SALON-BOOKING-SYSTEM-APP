import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/payment_method_screen.dart';

class ReviewSummaryScreen extends StatelessWidget {
  final String salonName;
  final String specialist;
  final String date;
  final String time;

  const ReviewSummaryScreen({
    super.key,
    required this.salonName,
    required this.specialist,
    required this.date,
    required this.time,
  });

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
          "Review Summary",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // 1. Salon Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.store, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(salonName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text("0993 Novick Parkway", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Booking Details
            _buildDetailSection("Booking Details", [
              {"label": "Services", "value": "Haircut, Shaving"},
              {"label": "Specialist", "value": specialist},
              {"label": "Date & Time", "value": "$date | $time"},
            ]),
            const SizedBox(height: 24),

            // 3. Payment Details
            _buildDetailSection("Payment Details", [
              {"label": "Amount", "value": "\$40.00"},
              {"label": "Tax", "value": "\$2.00"},
              {"label": "Total", "value": "\$42.00"},
            ], isTotal: true),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
            );
          },
          child: const Text("Confirm Payment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Map<String, String>> items, {bool isTotal = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Divider(height: 24),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item["label"]!, style: TextStyle(color: Colors.grey[600])),
                Text(
                  item["value"]!,
                  style: TextStyle(
                    fontWeight: isTotal && item["label"] == "Total" ? FontWeight.bold : FontWeight.w600,
                    color: isTotal && item["label"] == "Total" ? const Color(0xFF480177) : Colors.black,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
