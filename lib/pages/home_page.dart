import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Function to navigate to a new page
  void _navigateToPage(BuildContext context, String pageName) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PageToNavigateTo(pageName: pageName),
    ));
  }

  Widget _buildCard(BuildContext context, String title, String imagePath,
      String description) {
    final additionalText = 'Life at $title'; // Additional text
    final cardWidth =
        MediaQuery.of(context).size.width * 0.7; // Adjust the card width

    return InkWell(
      onTap: () => _navigateToPage(context, title),
      child: Container(
        padding: const EdgeInsets.all(16.0), // Increase the padding
        width: cardWidth, // Set the desired card width
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Apply rounded corners
          ),
          child: Column(
            children: [
              ClipRRect(
                // Use ClipRRect to clip the image
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      additionalText, // Additional text
                      style: const TextStyle(
                        fontSize: 16, // Adjust font size as needed
                        decoration: TextDecoration.underline, // Add underline
                      ),
                    ),
                    const SizedBox(
                      height:
                          10, // Add some space between additional text and description
                    ),
                    Text(
                      description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to green
      body: Center(
        child: ListView(
          // Wrap the Column in a ListView
          shrinkWrap: true,
          children: [
            _buildCard(
              context,
              'UMass Amherst',
              'assets/priscilla-du-preez-XkKCui44iM0-unsplash.jpg',
              'You’ll become a part of a vibrant, open community where bold, revolutionary thinking is celebrated—whether you join us on campus or online, and wherever you are in the world.',
            ),
            _buildCard(
              context,
              'Stanford',
              'assets/wonderlane-6zlgM-GUd6I-unsplash.jpg',
              'Comprising more than 25 offices and centers, Student Affairs provides a broad range of services and support to Stanford students, including leadership development, residential programs, public service, career exploration and community engagement.',
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
