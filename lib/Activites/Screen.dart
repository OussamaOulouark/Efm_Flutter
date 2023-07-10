import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen extends StatelessWidget {
  Screen();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadTraineesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data.'),
            );
          }

          List<dynamic> traineesData = snapshot.data!;
          int totalNames = traineesData.length;

          return Scaffold(
            appBar: AppBar(
              title: Text("World Skills"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(200, 176, 133, 141),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Total number of names: $totalNames",
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle left button press
                            },
                            child: const Text('back'),
                          ),
                          SizedBox(width: 10.0), // Add space between the buttons and text
                          Text(''),
                          SizedBox(width: 10.0), // Add space between the buttons and text
                          ElevatedButton(
                            onPressed: () {
                              // Handle right button press
                            },
                            child: const Text('next'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<List<dynamic>> _loadTraineesData() async {
    String traineesAsJsonString = await rootBundle.loadString("assets/trainees.json");
    List<dynamic> traineesData = jsonDecode(traineesAsJsonString);

    return traineesData;
  }
}
