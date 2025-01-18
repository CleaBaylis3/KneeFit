import 'package:flutter/material.dart';

void main() {
  runApp(KneeRehabApp());
}class LiveDataScreen extends StatelessWidget {
  const LiveDataScreen({super.key});

class KneeRehabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knee Rehabilitation Program',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> phases = [
    'Phase 1: Recovery from Surgery',
    'Phase 2: Strength & Neuromuscular Control',
    'Phase 3: Running, Agility & Landings',
    'Phase 4: Return to Sport',
    'Phase 5: Prevention of Re-injury'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Knee Rehabilitation Program')),
      body: ListView.builder(
        itemCount: phases.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(phases[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseScreen(phase: phases[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExerciseScreen extends StatelessWidget {
  final String phase;

  ExerciseScreen({required this.phase});

  final Map<String, List<Map<String, String>>> exercises = {
    'Phase 1: Recovery from Surgery': [
      {'name': 'Heel Slides', 'target': 'Quadriceps, Hamstrings, Hip Flexors', 'reps': '3 sets of 10', 'frequency': '5-7x a week'},
      {'name': 'Quad Sets', 'target': 'Quadriceps', 'reps': '3 sets of 10', 'frequency': '5-7x a week'},
      {'name': 'Straight Leg Raises', 'target': 'Quadriceps', 'reps': '3 sets of 10', 'frequency': '5-7x a week'},
      {'name': 'Passive Knee Extension', 'target': 'Hamstrings, Calf', 'reps': 'Hold for 5-10 minutes', 'frequency': '5-7x a week'},
      {'name': 'Ankle Pumps', 'target': 'Calf, Tibialis Anterior', 'reps': '3 sets of 10', 'frequency': '5-7x a week'},
    ],
    'Phase 2: Strength & Neuromuscular Control': [
      {'name': 'Mini Squats', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus', 'reps': '3 sets of 10', 'frequency': '3-5x a week'},
      {'name': 'Calf Raises', 'target': 'Calf', 'reps': '3 sets of 10', 'frequency': '3-5x a week'},
      {'name': 'Step-Ups', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus', 'reps': '3 sets of 10', 'frequency': '3-5x a week'},
      {'name': 'Hamstring Curls', 'target': 'Hamstrings', 'reps': '3 sets of 10', 'frequency': '3-5x a week'},
    ],
    'Phase 3: Running, Agility & Landings': [
      {'name': 'Ladder Drills', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus, Calf, Tibialis Anterior', 'reps': '3-5x each pattern', 'frequency': '2-3x a week'},
      {'name': 'Acceleration & Deceleration', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus, Calf', 'reps': '3-5x', 'frequency': '2-3x a week'},
      {'name': 'Jumping', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus, Calf', 'reps': '3 sets of 10', 'frequency': '2-3x a week'},
      {'name': 'Single Leg Squat', 'target': 'Quadriceps, Hamstring, Gluteus Maximus', 'reps': '3 sets of 10', 'frequency': '2-3x a week'},
    ],
    'Phase 4: Return to Sport': [
      {'name': 'Sport-Specific Drills', 'target': 'Full body strength & endurance', 'reps': 'Varies', 'frequency': '2-3x a week'},
      {'name': 'Functional Movement Tests', 'target': 'Leg symmetry & mobility', 'reps': 'Test-based', 'frequency': 'As required'},
    ],
    'Phase 5: Prevention of Re-injury': [
      {'name': 'Plyometrics', 'target': 'Quadriceps, Hamstrings, Gluteus Maximus', 'reps': '3 sets of 10', 'frequency': 'More than once a week'},
      {'name': 'Balance & Strength Training', 'target': 'Lower body stabilization', 'reps': 'Varies', 'frequency': 'At least 6 weeks'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(phase)),
      body: ListView.builder(
        itemCount: exercises[phase]?.length ?? 0,
        itemBuilder: (context, index) {
          var exercise = exercises[phase]![index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(exercise['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("Muscles: ${exercise['target']}\nReps: ${exercise['reps']}\nFrequency: ${exercise['frequency']}", style: TextStyle(fontSize: 14)),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(KneeRehabApp());
// }

// class KneeRehabApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Knee Rehab Program',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Knee Rehabilitation Program')),
//       body: ListView(
//         children: [
//           _buildPhaseCard(context, 'Phase 1: Recovery from Surgery', Phase1Screen()),
//           _buildPhaseCard(context, 'Phase 2: Strength and Neuromuscular Control', Phase2Screen()),
//           _buildPhaseCard(context, 'Phase 3: Running, Agility, and Landings', Phase3Screen()),
//           _buildPhaseCard(context, 'Phase 4: Return to Sport', Phase4Screen()),
//           _buildPhaseCard(context, 'Phase 5: Prevention of Re-injury', Phase5Screen()),
//         ],
//       ),
//     );
//   }

//   Widget _buildPhaseCard(BuildContext context, String title, Widget screen) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         trailing: Icon(Icons.arrow_forward),
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => screen),
//         ),
//       ),
//     );
//   }
// }

// // Sample screen for Phase 1, similar structure can be applied for other phases
// class Phase1Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phase 1: Recovery from Surgery')),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           _buildExerciseCard('Heel Slides', 'Quadriceps, hamstrings, hip flexors',
//               'Lie on your back, slide your heel up towards your bottom and back down.', '3 sets of 10', '5-7x a week'),
//           _buildExerciseCard('Quad Sets', 'Quadriceps',
//               'Tighten thigh muscles, push knee into ground, hold for 5 seconds.', '3 sets of 10', '5-7x a week'),
//           _buildExerciseCard('Straight Leg Raises', 'Quadriceps',
//               'Lie on your back, raise leg 6-10 inches, hold for 5 seconds.', '3 sets of 10', '5-7x a week'),
//           _buildExerciseCard('Passive Knee Extension', 'Hamstrings, calf',
//               'Sit on a chair, heel on another chair, let gravity stretch muscles.', 'Hold 5-10 minutes', '5-7x a week'),
//           _buildExerciseCard('Ankle Pumps', 'Calf, tibialis anterior',
//               'Bend ankle up and down, pointing toes away and towards you.', '3 sets of 10', '5-7x a week'),
//         ],
//       ),
//     );
//   }

//   Widget _buildExerciseCard(String name, String muscles, String description, String reps, String frequency) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 4),
//             Text('Muscles worked: $muscles', style: TextStyle(fontStyle: FontStyle.italic)),
//             SizedBox(height: 4),
//             Text(description),
//             SizedBox(height: 4),
//             Text('Repetitions: $reps'),
//             Text('Frequency: $frequency'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Placeholder screens for other phases
// class Phase2Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phase 2: Strength and Neuromuscular Control')),
//       body: Center(child: Text('Exercises for Phase 2')),
//     );
//   }
// }

// class Phase3Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phase 3: Running, Agility, and Landings')),
//       body: Center(child: Text('Exercises for Phase 3')),
//     );
//   }
// }

// class Phase4Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phase 4: Return to Sport')),
//       body: Center(child: Text('Exercises for Phase 4')),
//     );
//   }
// }

// class Phase5Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phase 5: Prevention of Re-injury')),
//       body: Center(child: Text('Exercises for Phase 5')),
//     );
//   }
// }
