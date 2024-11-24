import 'package:flutter/material.dart';
import 'Exercise.dart';

class ExerciseDetailPage extends StatefulWidget {
  final Exercise exercise;
  final Function(bool) onFavoriteToggle;
  final VoidCallback onAddToTracker;

  const ExerciseDetailPage({
    super.key,
    required this.exercise,
    required this.onFavoriteToggle,
    required this.onAddToTracker,
  });

  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.exercise.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.exercise.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.exercise.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Favorite Button
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                    widget.onFavoriteToggle(isFavorited);
                  },
                ),
                const Text('Favorite'),
              ],
            ),

            // Add to Tracker Button
            ElevatedButton(
              onPressed: widget.onAddToTracker,
              child: const Text('Add to Tracker'),
            ),
          ],
        ),
      ),
    );
  }
}
