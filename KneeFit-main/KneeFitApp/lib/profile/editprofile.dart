import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Controller for the username TextField
  final TextEditingController _usernameController = TextEditingController();

  // Whether the user is editing the username
  bool _isEditing = false;

  // Default username
  String _username = 'John Doe';

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the current username
    _usernameController.text = _username;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_pic.png'), // Placeholder image
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Username Field
            Row(
              children: [
                Expanded(
                  child: _isEditing
                      ? TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                        )
                      : Text(
                          _username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(_isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    if (_isEditing) {
                      // Save the new username
                      setState(() {
                        _username = _usernameController.text;
                        _isEditing = false;
                      });
                    } else {
                      // Enable editing mode
                      setState(() {
                        _isEditing = true;
                      });
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Email Section (Static for now)
            const Text(
              'Email: johndoe@example.com',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Log Out Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle log out logic
                },
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
