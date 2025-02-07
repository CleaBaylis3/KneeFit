import 'package:flutter/material.dart';
import 'styles/text_styles.dart';

import 'BlueTooth.dart';
import 'Profile.dart';
import 'Notifications.dart';
import 'LiveData.dart';
import 'Rehabilitation.dart';
import 'CalendarPage.dart';
import 'ProgramInfoScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KneeFit',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyles.title,
          ),
        //useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'KneeFit',
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const HomeScreenContent(),        // Home Page (Index 0)
    const RehabilitationScreen(),     // Rehabilitation/Exercises Page (Index 1)
    const ProfilePage(),              // Profile Page (Index 2)
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedIndex == 1 ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: true,
        actions: _selectedIndex == 1
            ? [ 
                IconButton(
                  icon: const Icon(Icons.info_outline, color: Colors.black),
                  tooltip: 'Program Information',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProgramInfoScreen()),
                    );
                  },
                ),
              ]
            : [ 
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      tooltip: 'Notifications',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationsPage()),
                        );
                      },
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 8,
                          minHeight: 8,
                        ),
                        child: const Text(
                          '3', // Example unread count
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
      ),
      body: _pages[_selectedIndex], 

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Rehabilitation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Highlight color for the active tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}


// HomeScreenContent (Separated Home Page Layout)
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homescreen_background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Page content with transparency
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.3),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'WELCOME TO KNEEFIT',
                  style: TextStyles.maintitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Connect to Brace button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectToBraceScreen()),
                    );
                  },
                  icon: const Icon(Icons.link, color: Colors.white,),
                  label: Text('Connect to Brace', style: TextStyles.button),
                  style: _buttonStyle(Colors.blue),
                ),
                const SizedBox(height: 20),

                // Track Live Data button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveDataScreen()),
                    );
                  },
                  icon: const Icon(Icons.data_usage, color: Colors.white),
                  label: Text('Track Live Data', style: TextStyles.button),
                  style: _buttonStyle(Colors.blue),
                ),
                const SizedBox(height: 20),

                // Calendar button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarPage()),
                    );
                  },
                  icon: const Icon(Icons.calendar_today,color: Colors.white),
                  label: Text('Calendar', style: TextStyles.button),
                  style: _buttonStyle(Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// Define a common button style function
ButtonStyle _buttonStyle(Color color) {
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 30), // Larger buttons
    backgroundColor: color, // Dynamic button color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // Rounded corners
    ),
    elevation: 5, // Shadow effect
    textStyle: TextStyles.subheading,
    minimumSize: const Size(300, 60),
  );
}

// Logo Widget
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/QbitLogo.jpeg',
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }
}
