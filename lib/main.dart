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

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar Demo'), actions: <Widget>[
        IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Here is snackbar')));
            },
            tooltip: 'Show Snackbar',
            icon: const Icon(Icons.add_alert)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const MyApp();
              }));
            },
            tooltip: 'Go to next page',
            icon: const Icon(Icons.navigate_next)),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const AppList();
              }));
            },
            tooltip: 'Go to next page',
            icon: const Icon(Icons.navigation_rounded)),
      ]),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
            ButtonSection(),
          ],
        ),
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

class AppList extends StatelessWidget {
  const AppList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Shoping List';

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(title: const Text(title)),
            body: ListView(children: const <Widget>[
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Photo'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
              ),
            ])));
  }
}

// Create Button Widget
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41')
        ],
      ),
    );
  }
}
