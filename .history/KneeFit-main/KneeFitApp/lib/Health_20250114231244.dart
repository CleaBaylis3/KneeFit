import 'package:flutter/material.dart';

class HealthStatisticsPage extends StatelessWidget {
  const HealthStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Statistics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart Monitor Widget
            const HeartMonitorWidget(),
            const SizedBox(height: 20), // Spacing

            // Kilometers Ran Widget
            const InfoCard(
              title: 'Kilometers Ran',
              value: '5.2 km',
              icon: Icons.directions_run,
              color: Colors.blue,
            ),
            const SizedBox(height: 20), // Spacing

            // Calories Burned Widget
            const InfoCard(
              title: 'Calories Burned',
              value: '300 kcal',
              icon: Icons.local_fire_department,
              color: Colors.red,
            ),
            const SizedBox(height: 20), // Spacing

            // Steps Taken Widget
            const InfoCard(
              title: 'Steps Taken',
              value: '8,000 steps',
              icon: Icons.directions_walk,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

// Heart Monitor Widget
class HeartMonitorWidget extends StatefulWidget {
  const HeartMonitorWidget({super.key});

  @override
  _HeartMonitorWidgetState createState() => _HeartMonitorWidgetState();
}

class _HeartMonitorWidgetState extends State<HeartMonitorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 100.0, end: 120.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Icon(
                Icons.favorite,
                color: Colors.red,
                size: _animation.value,
              );
            },
          ),
          const SizedBox(height: 10),
          const Text(
            '72 BPM',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Info Card Widget
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
