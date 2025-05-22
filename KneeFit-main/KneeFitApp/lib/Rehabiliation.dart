import 'package:flutter/material.dart';

void main() {
  runApp(KneeRehabApp());
}

class KneeRehabApp extends StatelessWidget {
  const KneeRehabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knee Rehab Program',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Knee Rehabilitation Program')),
      body: ListView(
        children: [
          _buildPhaseCard(context, 'Phase 1: Recovery from Surgery', Phase1Screen()),
          _buildPhaseCard(context, 'Phase 2: Strength and Neuromuscular Control', Phase2Screen()),
          _buildPhaseCard(context, 'Phase 3: Running, Agility, and Landings', Phase3Screen()),
          _buildPhaseCard(context, 'Phase 4: Return to Sport', Phase4Screen()),
          _buildPhaseCard(context, 'Phase 5: Prevention of Re-injury', Phase5Screen()),
        ],
      ),
    );
  }

  Widget _buildPhaseCard(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
      ),
    );
  }
}

// Sample screen for Phase 1, similar structure can be applied for other phases
class Phase1Screen extends StatelessWidget {
  const Phase1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 1: Recovery from Surgery')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExerciseCard('Heel Slides', 'Quadriceps, hamstrings, hip flexors',
              'Lie on your back, slide your heel up towards your bottom and back down.', '3 sets of 10', '5-7x a week'),
          _buildExerciseCard('Quad Sets', 'Quadriceps',
              'Tighten thigh muscles, push knee into ground, hold for 5 seconds.', '3 sets of 10', '5-7x a week'),
          _buildExerciseCard('Straight Leg Raises', 'Quadriceps',
              'Lie on your back, raise leg 6-10 inches, hold for 5 seconds.', '3 sets of 10', '5-7x a week'),
          _buildExerciseCard('Passive Knee Extension', 'Hamstrings, calf',
              'Sit on a chair, heel on another chair, let gravity stretch muscles.', 'Hold 5-10 minutes', '5-7x a week'),
          _buildExerciseCard('Ankle Pumps', 'Calf, tibialis anterior',
              'Bend ankle up and down, pointing toes away and towards you.', '3 sets of 10', '5-7x a week'),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(String name, String muscles, String description, String reps, String frequency) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Muscles worked: $muscles', style: const TextStyle(fontStyle: FontStyle.italic)),
            const SizedBox(height: 4),
            Text(description),
            const SizedBox(height: 4),
            Text('Repetitions: $reps'),
            Text('Frequency: $frequency'),
          ],
        ),
      ),
    );
  }
}

// Placeholder screens for other phases
class Phase2Screen extends StatelessWidget {
  const Phase2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 2: Strength and Neuromuscular Control')),
      body: const Center(child: Text('Exercises for Phase 2')),
    );
  }
}

class Phase3Screen extends StatelessWidget {
  const Phase3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 3: Running, Agility, and Landings')),
      body: const Center(child: Text('Exercises for Phase 3')),
    );
  }
}

class Phase4Screen extends StatelessWidget {
  const Phase4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 4: Return to Sport')),
      body: const Center(child: Text('Exercises for Phase 4')),
    );
  }
}

class Phase5Screen extends StatelessWidget {
  const Phase5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phase 5: Prevention of Re-injury')),
      body: const Center(child: Text('Exercises for Phase 5')),
    );
  }
}
