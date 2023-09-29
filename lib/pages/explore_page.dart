import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University Predictor',
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the button color to green
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20.0, // Increase the font size
            fontFamily: 'Roboto', // Use the Roboto font
            color: Colors.black,
          ),
        ),
      ),
      home: const ExplorePage(),
    );
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Define variables to store user input for the first and second parts of the form
  double greScores = 320.0;
  double toeflScores = 85.0;
  double cgpa = 7.5;
  int papersPublished = 0;
  String? hasLorValue;
  double workExperience = 0.0;

  // A variable to track which part of the form is currently visible
  FormPart visiblePart = FormPart.first; // Initially, show the first part

  // Function to clear all form data
  void clearForm() {
    setState(() {
      greScores = 0.0;
      toeflScores = 0.0;
      cgpa = 0.0;
      papersPublished = 0;
      hasLorValue = null;
      workExperience = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Center(
        // Center the form on the page
        child: Padding(
          padding:
              const EdgeInsets.all(32.0), // Increase spacing around form inputs
          child: Card(
            elevation: 8, // Add a little elevation for a card-like appearance
            child: Padding(
              padding: const EdgeInsets.all(
                  24.0), // Increase spacing around form inputs
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (visiblePart ==
                      FormPart.first) // Show the first part conditionally
                    Column(
                      children: [
                        // GRE Scores Input
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Your GRE Score',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              greScores = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 40.0), // Add more spacing between inputs

                        // TOEFL Scores Input
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Your TOEFL Score',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              toeflScores = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 40.0), // Add more spacing between inputs

                        // Required CGPA Input
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'CGPA /10',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              cgpa = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),

                        // Next Button (to show the second part)
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              visiblePart =
                                  FormPart.second; // Show the second part
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set the button color to green
                            textStyle: const TextStyle(
                              fontSize: 20.0, // Increase the font size
                              fontFamily: 'Roboto', // Use the Roboto font
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white), // Set text color to white
                          ),
                        ),
                      ],
                    ),
                  if (visiblePart ==
                      FormPart.second) // Show the second part conditionally
                    Column(
                      children: [
                        // Number of Papers Published Input
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Number of Papers Published',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              papersPublished = int.tryParse(value) ?? 0;
                            });
                          },
                        ),

                        const SizedBox(
                            height: 40.0), // Add more spacing between inputs

                        // LOR Input (Dropdown)
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText:
                                'Do you have a Letter of Recommendation ?',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          value: hasLorValue,
                          onChanged: (value) {
                            setState(() {
                              hasLorValue = value;
                            });
                          },
                          items: ['Yes', 'No']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                        const SizedBox(
                            height:
                                20.0), // Increase spacing between LOR and work experience inputs

                        // Preferred Work Experience Input
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Relevant Work Experience (months)',
                          ),
                          style: const TextStyle(
                            fontSize: 20.0, // Increase the font size
                            fontFamily: 'Roboto', // Use the Roboto font
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              workExperience = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),

                        // Previous, Clear Form, and Submit Buttons
                        Column(
                          // Wrap Previous and Clear Form buttons in a Column
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      visiblePart =
                                          FormPart.first; // Show the first part
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .green, // Set the button color to green
                                    textStyle: const TextStyle(
                                      fontSize: 20.0, // Increase the font size
                                      fontFamily:
                                          'Roboto', // Use the Roboto font
                                    ),
                                  ),
                                  child: const Text(
                                    'Previous',
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Set text color to white
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: clearForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .black, // Set the button color to transparent
                                    textStyle: const TextStyle(
                                      fontSize: 16.0, // Decrease the font size
                                      fontFamily:
                                          'Roboto', // Use the Roboto font
                                      color: Colors.black, // Text color
                                    ),
                                  ),
                                  child: const Text('Clear Form'),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Perform actions with collected data (e.g., prediction)
                                // You can add your prediction logic here
                                // For now, we'll print the collected data
                                logger.i('GRE Scores: $greScores');
                                logger.i('TOEFL Scores: $toeflScores');
                                logger.i('Required CGPA: $cgpa');
                                logger.i(
                                    'Number of Papers Published: $papersPublished');
                                logger.i('LOR: $hasLorValue');
                                logger.i(
                                    'Preferred Work Experience: $workExperience');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .black, // Set the button color to black
                                textStyle: const TextStyle(
                                  fontSize: 20.0, // Increase the font size
                                  fontFamily: 'Roboto', // Use the Roboto font
                                ),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors
                                        .white), // Set text color to white
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum FormPart {
  first,
  second,
}
