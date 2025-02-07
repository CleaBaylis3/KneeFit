import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // List of notifications (dynamic)
  List<String> notifications = [
    'This is the first notification.',
    'This is the second notification.',
    'This is the third notification.',
  ];

  // Function to delete a notification
  void deleteNotification(int index) {
  final deletedNotification = notifications[index];
  setState(() {
    notifications.removeAt(index);
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Notification deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            notifications.insert(index, deletedNotification);
          });
        },
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'No new notifications',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(notifications[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteNotification(index); // Delete this notification
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}


