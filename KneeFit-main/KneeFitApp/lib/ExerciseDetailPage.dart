import 'package:flutter/material.dart';
import 'styles/text_styles.dart';
import 'Rehabilitation.dart';

class ExerciseDetailPage extends StatelessWidget {
  final Exercise exercise;
  

  const ExerciseDetailPage({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyles.subheading,
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
                style: TextStyles.exercise,
              ),
            ),
          ],
        ),
      ),
    );
  }
}