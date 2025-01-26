import 'package:flutter/material.dart';
import 'ExerciseDetail.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  // List of exercises
  final List<Exercise> exercises = [
    Exercise(
      name: 'Hip Abduction',
      imagePath: 'assets/hipabduction.jpg',
      description: ' ',
    ),
    Exercise(
      name: 'Calf Raises',
      imagePath: 'assets/calfraises.jpg',
      description: ' ',
    ),
    Exercise(
      name: 'Supine Hamstring',
      imagePath: 'assets/supinehamstring.jpg',
      description: ' ',
    ),
    Exercise(
      name: 'Heel Cord Stretch',
      imagePath: 'assets/heelcord.jpg',
      description:'Press both feet flat into the floor and press hips forward toward the wall and hold position.\n\nMuscles worked: Posterior calf muscles (gastrocnemius and soleus).\nIntensity: Low - adjustable with amount of force applied into stretch\nRepetitions: 4 sets of 30s stretch hold\nFrequency: 5-7 days/week',
    ),
    Exercise(
      name: 'Standing Quadriceps Stretch',
      imagePath: 'assets/quadriceps.jpg',
      description:' ',
    ),
    Exercise(
      name: 'Half Squats',
      imagePath: 'assets/halfsquats.jpg',
      description: 'Build lower body strength and stability.',
    ),
    Exercise(
      name: 'Ham String Curls',
      imagePath: 'assets/hamstringcurls.jpg',
      description: ' ',
    ),
  ];

  // List of favorite exercises
  final Set<Exercise> favorites = {};

  // Add to tracker list
  final List<Exercise> trackerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Two cards per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1, // Square cards
        ),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return GestureDetector(
            onTap: () {
              // Navigate to Exercise Detail Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailPage(
                    exercise: exercise,
                    onFavoriteToggle: (isFavorited) {
                      setState(() {
                        if (isFavorited) {
                          favorites.add(exercise);
                        } else {
                          favorites.remove(exercise);
                        }
                      });
                    },
                    onAddToTracker: () {
                      setState(() {
                        if (!trackerList.contains(exercise)) {
                          trackerList.add(exercise);
                        }
                      });
                    },
                  ),
                ),
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          exercise.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        exercise.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Exercise Model
class Exercise {
  final String name;
  final String imagePath;
  final String description;

  Exercise({
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Exercise &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
