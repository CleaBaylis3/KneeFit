import 'package:flutter/material.dart';

class ProgramInfoScreen extends StatelessWidget {
  const ProgramInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Purpose of program:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Following an injury or surgery, a rehabilitation program will help you return to regular daily activities. '
                'This program will help restore function, strength, and mobility to the knee. Overall, the goal is to promote '
                'healing, rebuild strength, improve range of motion (ROM), and prevent future injury.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Strength:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Building strength in the muscles that support your knee will help to alleviate stress on the joint. '
                'Strong muscles allow your knee to absorb shock.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Flexibility:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Stretching the muscles you strengthen is essential to regain range of motion and prevent injury. '
                'Gentle stretching following strength exercises can reduce muscle soreness and maintain muscle length and flexibility.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Target Muscles:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '- Quadriceps\n- Hamstrings\n- Gluteus maximus\n- Calf\n- Tibialis anterior',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}