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
  bool _acceptedPolicy = false;

  final List<String> _timeSlots = [
    "09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM"
  ];

  final List<Map<String, String>> _specialists = [
    {"name": "Nathan", "role": "Master Barber"},
    {"name": "Jenny", "role": "Color Expert"},
    {"name": "Oscar", "role": "Stylist"},
    {"name": "Bella", "role": "Makeup Artist"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
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
              height: 120,
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
                      width: 90,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? colorScheme.primary : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: isSelected ? colorScheme.primary : Colors.grey[200],
                              child: Icon(Icons.person, color: isSelected ? Colors.white : Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _specialists[index]["name"]!,
                            style: TextStyle(
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            _specialists[index]["role"]!,
                            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // 2. Select Date
            const Text("Select Date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
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
                      color: isSelected ? colorScheme.primary : Colors.white,
                      border: Border.all(color: colorScheme.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected ? Colors.white : colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            
            const SizedBox(height: 32),
            
            // 4. Cancellation Policy
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.withValues(alpha: 0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text("Cancellation Policy", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Free cancellation up to 24 hours before your appointment. Late cancellations or no-shows may incur a 50% fee.",
                    style: TextStyle(fontSize: 12, color: Colors.red[900]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptedPolicy,
                        activeColor: Colors.red,
                        onChanged: (v) {
                          setState(() {
                            _acceptedPolicy = v ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          "I understand and agree to the policy.",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: _acceptedPolicy ? () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewSummaryScreen(
                  salonName: widget.salonName,
                  specialist: _selectedSpecialist,
                  date: "${_selectedDate.day} ${_getMonthName(_selectedDate.month)} ${_selectedDate.year}",
                  time: _selectedTime,
                ),
              ),
            );
          } : null,
          child: const Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }
}
