import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon_booking_app/providers/booking_provider.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
    final serviceName = bookingProvider.selectedServiceName ?? "N/A";
    final servicePrice = bookingProvider.selectedServicePrice ?? 0.0;
    final tax = servicePrice * 0.05;
    final total = servicePrice + tax;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Summary"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // 1. Salon Info Card
            Container(
              padding: const EdgeInsets.all(20),
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
                    width: 70, height: 70,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.auto_awesome, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(salonName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Exclusive Boutique Salon", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Booking Details
            _buildDetailSection(context, "Booking Details", [
              {"label": "Selected Service", "value": serviceName},
              {"label": "Stylist", "value": specialist},
              {"label": "Appointment", "value": "$date | $time"},
            ]),
            const SizedBox(height: 24),

            // 3. Payment Details
            _buildDetailSection(context, "Premium Breakdown", [
              {"label": "Service Fee", "value": "\$${servicePrice.toStringAsFixed(2)}"},
              {"label": "Luxury Tax (5%)", "value": "\$${tax.toStringAsFixed(2)}"},
              {"label": "Total Amount", "value": "\$${total.toStringAsFixed(2)}"},
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
          child: const Text("Confirm & Proceed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context, String title, List<Map<String, String>> items, {bool isTotal = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
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
                Text(item["label"]!, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500)),
                Text(
                  item["value"]!,
                  style: TextStyle(
                    fontWeight: isTotal && item["label"] == "Total Amount" ? FontWeight.bold : FontWeight.w600,
                    color: isTotal && item["label"] == "Total Amount" ? colorScheme.primary : colorScheme.onSurface,
                    fontSize: isTotal && item["label"] == "Total Amount" ? 18 : 14,
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
