import 'package:flutter/material.dart';
import 'package:ambition/pages/home_page.dart';
import 'package:ambition/pages/explore_page.dart';
import 'package:ambition/pages/settings_page.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  final List<Widget> pages = [
    const HomePage(),
    const ExplorePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Ambition',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.map), // Map icon for the selected state
            icon: Icon(Icons.map_outlined), // Map icon for the unselected state
            label: 'Roadmap', // Rename from "Settings" to "Roadmap"
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
