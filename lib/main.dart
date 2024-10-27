import 'package:flutter/material.dart';

// Function instruction: main job display the app to the user
void main() {
  // Material APP is class or contructor function
  // Create material widget
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.lightBlueAccent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.white,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const Center(
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, color: Colors.teal),
            ),
          ),
        ),
      ),
    ),
  );
}
