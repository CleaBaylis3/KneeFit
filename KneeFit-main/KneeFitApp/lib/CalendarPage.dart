import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Example progress data
  final Map<DateTime, List<String>> _progressData = {
    DateTime.utc(2025, 1, 22): ['Workout: Heel Cord Stretch'],
    DateTime.utc(2025, 1, 23): ['Workout: Plank', 'Workout: Half Squats'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return _progressData[day] ?? [];
            },
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to 2 weeks range
                  setState(() {
                    _focusedDay = DateTime.now(); // Keep focused day valid
                    debugPrint('2 Weeks Button Clicked');
                    debugPrint('Focused Day: $_focusedDay');
                  });
                },
                child: const Text('2 Weeks'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _focusedDay = DateTime.now()
                        .add(const Duration(days: 7)); // Next week
                    debugPrint('Next Week Button Clicked');
                    debugPrint('Focused Day: $_focusedDay');
                  });
                },
                child: const Text('Next Week'),
              ),
            ],
          ),
          if (_selectedDay != null)
            ...(_progressData[_selectedDay!] ?? [])
                .map((event) => ListTile(
                      leading:
                          const Icon(Icons.check_circle, color: Colors.green),
                      title: Text(event),
                    ))
                .toList(),
          if (_selectedDay != null &&
              (_progressData[_selectedDay!] ?? []).isEmpty)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No progress recorded on this day.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
