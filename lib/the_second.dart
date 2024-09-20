import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Card UI'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/profile_picture.png', // Replace with your image path
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
           const  SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Flutter Developer',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              'My name is Mbubah Stephen and I am a passionate Flutter developer with a knack for building beautiful and functional applications. Always eager to learn and explore new technologies.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {
                    // Handle Facebook press
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.transfer_within_a_station_sharp, color: Colors.lightBlue),
                  onPressed: () {
                    // Handle Twitter press
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.link, color: Colors.blueAccent),
                  onPressed: () {
                    // Handle LinkedIn press
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('View Profile'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle message button press
              },
              child: Text('Send Message'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
