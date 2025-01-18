import 'package:flutter/material.dart';

class RehabilitationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Knee Rehabilitation Program')),
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
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        ),
      ),
    );
  }
}

class PhaseScreen extends StatelessWidget {
  final String phaseTitle;
  final List<Map<String, String>> exercises;

  PhaseScreen({required this.phaseTitle, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(phaseTitle)),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: exercises.map((exercise) => _buildExerciseCard(exercise)).toList(),
      ),
    );
  }

  Widget _buildExerciseCard(Map<String, String> exercise) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Muscles worked: ${exercise['muscles']!}', style: TextStyle(fontStyle: FontStyle.italic)),
            SizedBox(height: 4),
            Text(exercise['description']!),
            SizedBox(height: 4),
            Text('Repetitions: ${exercise['reps']!}'),
            Text('Frequency: ${exercise['frequency']!}'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(KneeFitApp());
}

class KneeFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KneeFit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        '/rehabilitation': (context) => RehabilitationScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KneeFit Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/rehabilitation');
          },
          child: Text('Go to Rehabilitation Program'),
        ),
      ),
    );
  }
}
