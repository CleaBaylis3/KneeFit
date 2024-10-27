
import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  // This list holds the state of whether each exercise is completed
  Map<String, bool> exercises = {
    "Stretching": false,
    "Strength Training": false,
    "Cardio": false,
  };

  // Controller for the TextField input for adding a new exercise
  final TextEditingController _exerciseController = TextEditingController();

  // This will track the current date for the exercises
  DateTime today = DateTime.now();

  // Function to toggle the completion status of an exercise
  void toggleExercise(String exercise) {
    setState(() {
      exercises[exercise] = !exercises[exercise]!;
    });
  }

  // Function to add a new exercise
  void addExercise() {
    String newExercise = _exerciseController.text.trim();
    if (newExercise.isNotEmpty && !exercises.containsKey(newExercise)) {
      setState(() {
        exercises[newExercise] = false;
      });
    }
    _exerciseController.clear(); // Clear the input field
  }

  // Function to reset the daily exercises
  void resetExercises() {
    setState(() {
      exercises.updateAll((key, value) => false);
    });
  }

  @override
  void dispose() {
    _exerciseController.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Exercise Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.check_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Date: ${today.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Track Your Exercises:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            // Display the list of exercises with checkboxes
            Expanded(
              child: ListView(
                children: exercises.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: exercises[key],
                    onChanged: (bool? value) {
                      toggleExercise(key);
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Text field to add a new exercise
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _exerciseController,
                    decoration: const InputDecoration(
                      labelText: 'Add a new exercise',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addExercise,
                  child: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Button to reset exercises for the new day
            ElevatedButton(
              onPressed: resetExercises,
              child: const Text('Reset for New Day'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
