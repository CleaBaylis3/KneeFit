import 'package:flutter/material.dart';
import 'styles/text_styles.dart';
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
  final Map<DateTime, List<String>> _progressData = { };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(),
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
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
                todayTextStyle: TextStyles.calendardate, // Apply custom text style
                defaultTextStyle: TextStyles.calendardate, // Default text style
                selectedTextStyle: TextStyles.calendardate.copyWith(color: Colors.white), // Selected day styling
                weekendTextStyle: TextStyles.calendardate.copyWith(color: Colors.red),
                outsideTextStyle: TextStyles.calendarprevdate,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyles.calendartitle,
                weekendStyle: TextStyles.calendartitle.copyWith(color: Colors.red),
            ),
            headerStyle: HeaderStyle(
                formatButtonVisible: false, 
                titleTextStyle: TextStyles.calendardate,
              ),
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
                style: TextStyles.calendartitle,
              ),
            ),
        ],
      ),
    ),
    );
  }
}
