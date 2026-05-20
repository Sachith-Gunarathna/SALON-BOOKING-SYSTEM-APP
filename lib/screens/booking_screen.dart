import 'package:flutter/material.dart';
import 'package:salon_booking_app/screens/review_summary_screen.dart';

class BookingScreen extends StatefulWidget {
  final String salonName;

  const BookingScreen({super.key, required this.salonName});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = "10:00 AM";
  String _selectedSpecialist = "Nathan";

  final List<String> _timeSlots = [
    "09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM"
  ];

  final List<Map<String, String>> _specialists = [
    {"name": "Nathan", "role": "Senior Barber"},
    {"name": "Jenny", "role": "Hair Stylist"},
    {"name": "Oscar", "role": "Master Barber"},
    {"name": "Bella", "role": "Makeup Artist"},
  ];

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
          "Book Appointment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Select Specialist
            const Text("Select Specialist", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _specialists.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedSpecialist == _specialists[index]["name"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSpecialist = _specialists[index]["name"]!;
                      });
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: isSelected ? const Color(0xFF480177) : Colors.grey[200],
                            child: Icon(Icons.person, color: isSelected ? Colors.white : Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _specialists[index]["name"]!,
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? const Color(0xFF480177) : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // 2. Select Date (Simplified)
            const Text("Select Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 30)),
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 32),

            // 3. Select Time
            const Text("Select Time", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _timeSlots.map((time) {
                bool isSelected = _selectedTime == time;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF480177) : Colors.white,
                      border: Border.all(color: const Color(0xFF480177)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF480177),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewSummaryScreen(
                  salonName: widget.salonName,
                  specialist: _selectedSpecialist,
                  date: "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                  time: _selectedTime,
                ),
              ),
            );
          },
          child: const Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
