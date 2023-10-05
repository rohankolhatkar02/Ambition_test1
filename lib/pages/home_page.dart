import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Function to navigate to a new page
  void _navigateToPage(BuildContext context, String pageName) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PageToNavigateTo(pageName: pageName),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _navigateToPage(context, 'Page 1'),
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Image.asset(
                        'assets/priscilla-du-preez-XkKCui44iM0-unsplash.jpg'), // Replace with your image
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Life at UMass'),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => _navigateToPage(context, 'Page 2'),
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Image.asset(
                        'assets/wonderlane-6zlgM-GUd6I-unsplash.jpg'), // Replace with your image
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('Life at Stanford'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageToNavigateTo extends StatelessWidget {
  final String pageName;

  const PageToNavigateTo({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: Center(
        child: Text('This is $pageName'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
