import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final String serviceName;
  final String specialistName;
  final String date;
  final String time;
  final String status; // 'Upcoming', 'Completed', 'Cancelled'
  final double price;

  Appointment({
    required this.id,
    required this.serviceName,
    required this.specialistName,
    required this.date,
    required this.time,
    required this.status,
    required this.price,
  });
}

class BookingProvider with ChangeNotifier {
  final List<Appointment> _appointments = [
    Appointment(
      id: "1",
      serviceName: "Haircut & Styling",
      specialistName: "Nathan",
      date: "25 May 2026",
      time: "10:00 AM",
      status: "Upcoming",
      price: 25.0,
    ),
    Appointment(
      id: "2",
      serviceName: "Full Face Makeup",
      specialistName: "Bella",
      date: "15 May 2026",
      time: "02:00 PM",
      status: "Completed",
      price: 50.0,
    ),
  ];

  List<Appointment> get appointments => _appointments;

  List<Appointment> get upcomingAppointments =>
      _appointments.where((a) => a.status == "Upcoming").toList();

  List<Appointment> get pastAppointments =>
      _appointments.where((a) => a.status == "Completed" || a.status == "Cancelled").toList();

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void cancelAppointment(String id) {
    final index = _appointments.indexWhere((a) => a.id == id);
    if (index != -1) {
      _appointments[index] = Appointment(
        id: _appointments[index].id,
        serviceName: _appointments[index].serviceName,
        specialistName: _appointments[index].specialistName,
        date: _appointments[index].date,
        time: _appointments[index].time,
        status: "Cancelled",
        price: _appointments[index].price,
      );
      notifyListeners();
    }
  }

  // --- New Logic for Service Selection ---
  String? _selectedServiceName;
  double? _selectedServicePrice;

  String? get selectedServiceName => _selectedServiceName;
  double? get selectedServicePrice => _selectedServicePrice;

  void selectService(String name, double price) {
    _selectedServiceName = name;
    _selectedServicePrice = price;
    notifyListeners();
  }
}
