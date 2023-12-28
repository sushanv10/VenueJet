import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedEventOn = DateTime.now();
  DateTime? selectedEventUntil = DateTime.now();
  TimeOfDay selectedTimeFrom = TimeOfDay.now();
  TimeOfDay selectedTimeTo = TimeOfDay.now();
  int guestNumber = 1;
  String selectedEventType = 'Celebration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Venue'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Event Booking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildDateTimePicker(
                label: 'Event On',
                selectedDate: selectedEventOn,
                onDateChanged: _selectEventOnDate,
              ),
              SizedBox(height: 20),
              buildDateTimePicker(
                label: 'Event Until',
                selectedDate: selectedEventUntil,
                onDateChanged: _selectEventUntilDate,
              ),
              SizedBox(height: 20),
              buildTimePicker(
                label: 'Time From',
                selectedTime: selectedTimeFrom,
                onTimeChanged: _selectTimeFrom,
              ),
              SizedBox(height: 20),
              buildTimePicker(
                label: 'Time To',
                selectedTime: selectedTimeTo,
                onTimeChanged: _selectTimeTo,
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              buildEventTypeDropdown(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _confirmBooking(),
                    child: Text('Confirm Booking'),
                  ),
                  ElevatedButton(
                    onPressed: () => _deleteBooking(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Text('Delete Booking'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateTimePicker({
    required String label,
    required DateTime? selectedDate,
    required Function() onDateChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        InkWell(
          onTap: onDateChanged,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedDate?.toLocal().toString().split(' ')[0] ?? 'Select Date',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTimePicker({
    required String label,
    required TimeOfDay selectedTime,
    required Function() onTimeChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        InkWell(
          onTap: onTimeChanged,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedTime.format(context),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEventTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Event Type'),
        DropdownButton<String>(
          value: selectedEventType,
          onChanged: (String? newValue) {
            setState(() {
              selectedEventType = newValue ?? 'Celebration';
            });
          },
          items: <String>['Celebration', 'Meeting', 'Conference','Wedding', 'Other']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _selectEventOnDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEventOn ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEventOn = picked;
      });
    }
  }

  Future<void> _selectEventUntilDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEventUntil ?? selectedEventOn ?? DateTime.now(),
      firstDate: selectedEventOn ?? DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEventUntil = picked;
      });
    }
  }

  Future<void> _selectTimeFrom() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeFrom,
    );
    if (picked != null) {
      setState(() {
        selectedTimeFrom = picked;
      });
    }
  }

  Future<void> _selectTimeTo() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimeTo,
    );
    if (picked != null) {
      setState(() {
        selectedTimeTo = picked;
      });
    }
  }

  void _confirmBooking() {
    // Replace this with your actual confirmation logic
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: Text('Are you sure you want to confirm this booking?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Add your booking logic here

              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _deleteBooking() {
    // Replace this with your actual deletion logic
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Booking'),
          content: Text('Are you sure you want to delete this booking?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Add your deletion logic here

              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}

