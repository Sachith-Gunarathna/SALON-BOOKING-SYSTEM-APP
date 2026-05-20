import 'package:flutter/material.dart';
import 'booking_success_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedMethod = "Apple Pay";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your preferred secure payment method.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildPaymentItem("Apple Pay", Icons.apple, subtitle: "Instant secure payment"),
            _buildPaymentItem("Google Pay", Icons.account_balance_outlined, subtitle: "Fast checkout"),
            _buildPaymentItem("Credit/Debit Card", Icons.credit_card_rounded, subtitle: "Visa, Mastercard, Amex"),
            _buildPaymentItem("PayPal", Icons.account_balance_wallet_outlined, subtitle: "Safe and easy"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingSuccessScreen()),
            );
          },
          child: const Text("Complete Transaction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildPaymentItem(String name, IconData icon, {required String subtitle}) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isSelected = _selectedMethod == name;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = name;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.onSurface.withValues(alpha: 0.05),
            width: 2,
          ),
          boxShadow: isSelected ? [
            BoxShadow(color: colorScheme.primary.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10)),
          ] : [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? colorScheme.primary.withValues(alpha: 0.1) : Colors.grey[50],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isSelected ? colorScheme.primary : Colors.grey[400], size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? colorScheme.primary : Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
