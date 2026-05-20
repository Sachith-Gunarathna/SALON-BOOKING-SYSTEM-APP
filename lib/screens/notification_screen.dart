import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
          "Notification",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildNotificationSection("Today", [
            {
              "title": "Booking Successful!",
              "desc": "You have successfully booked an appointment with Belle Curls.",
              "icon": Icons.check_circle,
              "color": Colors.green,
            },
            {
              "title": "New Message from Salon",
              "desc": "Nathan has sent you a new message regarding your appointment.",
              "icon": Icons.chat_bubble,
              "color": Colors.blue,
            },
          ]),
          const SizedBox(height: 24),
          _buildNotificationSection("Yesterday", [
            {
              "title": "Payment Confirmed",
              "desc": "Your payment for the booking at Pretty Parlor has been confirmed.",
              "icon": Icons.payment,
              "color": Colors.orange,
            },
          ]),
        ],
      ),
    );
  }

  Widget _buildNotificationSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ...items.map((item) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: (item["color"] as Color).withValues(alpha: 0.1),
                child: Icon(item["icon"] as IconData, color: item["color"] as Color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["title"] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item["desc"] as String, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
