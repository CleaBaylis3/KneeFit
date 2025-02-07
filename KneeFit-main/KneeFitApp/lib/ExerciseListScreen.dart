import 'package:flutter/material.dart';
import 'styles/text_styles.dart';
import 'ExerciseDetailPage.dart';
import 'Rehabilitation.dart';

final Map<String, Color> phaseBackgroundColour = {
  "PHASE 1": const Color.fromARGB(255, 17, 155, 183),
  "PHASE 2": const Color.fromARGB(255, 43, 164, 234),
  "PHASE 3": const Color.fromARGB(255, 14, 85, 193),
  "PHASE 4": const Color.fromARGB(255, 10, 18, 174),
  "PHASE 5": const Color.fromARGB(255, 10, 4, 114),
};


class ExerciseListScreen extends StatelessWidget {
  final String phase;
  final String category;

  const ExerciseListScreen({super.key, required this.phase, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Exercise> categoryExercises = (exercisesByPhase[phase]?[category] as List<Exercise>?) ?? [];

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: phaseBackgroundColour[phase] ?? Colors.grey[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryExercises.length,
        itemBuilder: (context, index) {
          final exercise = categoryExercises[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Image.asset(exercise.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(
                exercise.name,
                style: TextStyles.exercise,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailPage(exercise: exercise),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}