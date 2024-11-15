// import 'package:flutter/material.dart';

// // Function instruction: main job display the app to the user
// void main() {
//   // Material APP is class or contructor function
//   // Create material widget
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         // backgroundColor: Colors.lightBlueAccent,
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Colors.lightBlueAccent,
//               Colors.white,
//             ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//           ),
//           child: const Center(
//             child: Text(
//               'Hello, Flutter! New Worldbaaa',
//               style: TextStyle(fontSize: 24, color: Colors.teal),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() => runApp(const AppBarApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Home Page'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  // const Text('Hello, World!!@'),
                  const PaddedText(text: 'Come on Woow !! Awsome '),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print('Click!@');
                    },
                    child: const Text('A button'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class AppBarApp extends StatelessWidget{
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget{
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Here is snackbar')));},
              icon: const Icon(Icons.add_alert))
        ]
      ),
    );
  }
}

class PaddedText extends StatelessWidget {
  final String text;
  const PaddedText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}
