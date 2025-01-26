import 'package:flutter/material.dart';
import 'Exercise.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;
  final ValueChanged<bool> onFavoriteToggle;
  final VoidCallback onAddToTracker;

  const ExerciseDetailPage({
    Key? key,
    required this.exercise,
    required this.onFavoriteToggle,
    required this.onAddToTracker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            SizedBox(
              height: 200, // Set the container height to be smaller
              width: double.infinity, // Full width
              child: Image.asset(
                exercise.imagePath,
                fit: BoxFit.contain, // Fit the entire image inside the container without cropping
              ),
            ),
            // Description Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                exercise.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Actions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () => onFavoriteToggle(true),
                ),
                ElevatedButton(
                  onPressed: onAddToTracker,
                  child: const Text('Add to Tracker'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}