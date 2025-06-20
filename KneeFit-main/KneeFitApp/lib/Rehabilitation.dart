import 'package:flutter/material.dart';
import 'styles/text_styles.dart';
import 'CategoryScreen.dart';

class Exercise {
  final String name;
  final String imagePath;
  final String description;

  Exercise({
    required this.name,
    required this.imagePath,
    required this.description,
  });
}


class RehabilitationScreen extends StatelessWidget {
  const RehabilitationScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rehabilitation_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.3),
          child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(height: 20),
            const Text(
              'REHABILITATION',
              style: TextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            ...exercisesByPhase.keys.map((phase) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: phasesColors[phase] ?? Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(phase: phase),
                      ),
                    );
                  },
                  child: Text(
                    phase,
                    textAlign: TextAlign.center,
                    style: TextStyles.button,
                  ),
                ),
              ),
            )).toList(),
            ],
          ),
        ),
      ),
    ]
    );
  }
}

final Map<String, Color> phasesColors = {
  "PHASE 1": const Color.fromARGB(255, 17, 155, 183),
  "PHASE 2": const Color.fromARGB(255, 43, 164, 234),
  "PHASE 3": const Color.fromARGB(255, 14, 85, 193),
  "PHASE 4": const Color.fromARGB(255, 10, 18, 174),
  "PHASE 5": const Color.fromARGB(255, 10, 4, 114),
};

final Map<String, Map<String, List<Exercise>>> exercisesByPhase = {
  'PHASE 1': {
    'Range of Motion': [
    Exercise(name: 'Heel Over Roll Stretch', imagePath: 'assets/images/heeloverroll.png', description: 'Muscles worked: Quadriceps, hamstrings, hip flexors.\nLie on your back with your legs straight. Using your affected leg, slide your heel up towards your bottom while keeping your heel on the floor. Slide your heel back down to the starting position.\nRepetitions: 3 sets of 10.\nFrequency: 5-7x a week .'),
    Exercise(name: 'Heel Slides', imagePath: 'assets/images/heelslides.jpg', description: 'Muscles worked: Quadriceps, hamstrings, hip flexors.\nLie on your back with your legs straight. Using your affected leg, slide your heel up towards your bottom while keeping your heel on the floor. Slide your heel back down to the starting position.\nRepetitions: 3 sets of 10.\nFrequency: 5-7x a week .'),
    Exercise(name: 'Passive Knee Extension', imagePath: 'assets/images/passivekneeextension.jpg', description: 'Muscles worked: Quadriceps, hamstrings, hip flexors.\nLie on your back with your legs straight. Using your affected leg, slide your heel up towards your bottom while keeping your heel on the floor. Slide your heel back down to the starting position.\nRepetitions: 3 sets of 10.\nFrequency: 5-7x a week .'),
    ],
    'Strengthening':[
    Exercise(name: 'Active Knee Flexion', imagePath: 'assets/images/activekneeflexion.jpg', description: 'Quad sets exercise.'),   
    Exercise(name: 'Seated Calf Raise', imagePath: 'assets/images/seatedcalfraise.jpg', description: 'Quad sets exercise.'),
    Exercise(name: 'Hip Abduction', imagePath: 'assets/images/hipadduction.png', description: ''),
    Exercise(name: 'Hip Flexion', imagePath: 'assets/images/hipflexion.png', description: ''), 
    ],
},
  'PHASE 2': {
    'Range of Motion': [
    Exercise(name: 'Prone Hangs', imagePath: 'assets/images/pronehangs.jpg', description: 'Mini squats exercise.'),
    Exercise(name: 'Hamstring Stretch', imagePath: 'assets/images/hamstringstretch.jpg', description: 'Mini squats exercise.'),
    Exercise(name: 'Gastroc Stretch With Towel', imagePath: 'assets/images/gastrocstretchwithtowel.jpg', description: 'Mini squats exercise.'),
    Exercise(name: 'Standing Gastroc Stretch', imagePath: 'assets/images/standinggastrocstretch.jpg', description: 'Mini squats exercise.'),
    ],
    'Strengthening':[
    Exercise(name: 'Knee Extension Concentric', imagePath: 'assets/images/kneeextensionconcentric.png', description: 'Calf raises exercise.'),
    Exercise(name: 'Hamstring Curls', imagePath: 'assets/images/hamstringcurls.jpeg', description: ''), 
    Exercise(name: 'Single Leg Squats', imagePath: 'assets/images/singlelegsquats.png', description: ''), 
    Exercise(name: 'Hip Adduction', imagePath: 'assets/images/hipadduction.png', description: ''), 
    Exercise(name: 'Calf Raises', imagePath: 'assets/images/calfraises.jpeg', description: ''), 
    ],
    'Balance':[
    Exercise(name: 'One Leg Balance', imagePath: 'assets/images/singlelegbalance.jpg', description: ''), 
    ],
  },
  'PHASE 3': {
    'Strengthening':[
    Exercise(name: 'Hamstring Curls', imagePath: 'assets/images/hamstringcurls.jpeg', description: ''), 
    Exercise(name: 'Squat', imagePath: 'assets/images/squat.png', description: ''), 
    Exercise(name: 'Set-Ups and Step-Downs', imagePath: 'assets/images/stepups.png', description: ''), 
    Exercise(name: 'Bridging', imagePath: 'assets/images/bridging.png', description: ''), 
    Exercise(name: 'Single Leg Calf Raises', imagePath: 'assets/images/singlelegcalfraises.png', description: ''), 
    Exercise(name: 'Deadlift', imagePath: 'assets/images/deadlift.png', description: ''), 
    ],
    'Balance':[
    Exercise(name: 'Wobble Board', imagePath: 'assets/images/wobbleboard.png', description: ''), 
    Exercise(name: 'Single Leg Balance', imagePath: 'assets/images/singlelegbalance.jpg', description: ''), 
    Exercise(name: 'Airplane', imagePath: 'assets/images/airplane.png', description: ''), 
    
    ],
  },
  'PHASE 4': {
    'Cardio':[
    Exercise(name: 'Jogging/Running', imagePath: 'assets/images/running.png', description: 'Heel slide exercise.'),
    Exercise(name: 'Skip Rope', imagePath: 'assets/images/skiprope.png', description: 'Quad sets exercise.'),
    ],
    'Strengthening':[
    Exercise(name: 'Runner Stepup', imagePath: 'assets/images/stepups.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Lunge', imagePath: 'assets/images/lunges.jpg', description: 'Quad sets exercise.'),
    Exercise(name: 'Monster Walk', imagePath: 'assets/images/monsterwalk.png', description: 'Quad sets exercise.'),
    ],
    'Balance':[
    Exercise(name: 'Double Leg Wobble Board', imagePath: 'assets/images/wobbleboard.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Single Leg Wobble Board', imagePath: 'assets/images/singlelegwobbleboard.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Two-legged Squat Wobble Board', imagePath: 'assets/images/squatwobbleboard.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Ball Toss Wobble Board', imagePath: 'assets/images/ballwobbleboard.png', description: 'Quad sets exercise.'),
    ],
    'Agility':[
    Exercise(name: 'Jump rope', imagePath: 'assets/images/jumprope.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Run', imagePath: 'assets/images/running.png', description: 'Quad sets exercise.'),
    Exercise(name: 'Agility ladder', imagePath: 'assets/images/agilityladder.png', description: 'Quad sets exercise.'),
    ],
  },
  'PHASE 5': {
    'Final Steps':[
    ],
  },
};


