import 'package:flutter/material.dart';
import 'styles/text_styles.dart';
import 'Rehabilitation.dart';
import 'ExerciseListScreen.dart';

final Map<String, Color> phaseBackgroundColour = {
  "PHASE 1": const Color.fromARGB(255, 17, 155, 183),
  "PHASE 2": const Color.fromARGB(255, 43, 164, 234),
  "PHASE 3": const Color.fromARGB(255, 14, 85, 193),
  "PHASE 4": const Color.fromARGB(255, 10, 18, 174),
  "PHASE 5": const Color.fromARGB(255, 10, 4, 114),
};

final Map<String, IconData> categoryIcons = {
  'Range of Motion': Icons.accessibility_new,  
  'Strengthening': Icons.fitness_center,  
  'Balance': Icons.self_improvement,
  'Cardio': Icons.directions_run,
  'Agility': Icons.emoji_people,
  'Final Steps': Icons.question_mark,
};

class CategoryScreen extends StatelessWidget {
  final String phase;

  const CategoryScreen({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Exercise>> categories = exercisesByPhase[phase] as Map<String, List<Exercise>>? ?? {};

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: phaseBackgroundColour[phase] ?? Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(phase,
              style: TextStyles.title,
            ),
            const SizedBox(height: 20),

          ...categories.keys.map((category) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Customize per category if needed
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseListScreen(phase: phase, category: category),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Icon(categoryIcons[category] ?? Icons.fitness_center, color: const Color.fromARGB(255, 0, 0, 0)), 
                    const SizedBox(width: 12), 
                Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyles.exercise,
                ),
               ],
              ),
              ),
            ),
          )).toList(),
          ],
        ),
      ),
    );
  }
}
