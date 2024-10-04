import 'package:flutter/material.dart';

class Recipepage extends StatefulWidget {
  //const Recipepage({super.key});

  @override
  State<Recipepage> createState() => _RecipepageState();
}

class _RecipepageState extends State<Recipepage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image
              Image.network(recipe['image'],
                  height: 345, width: double.infinity),

              SizedBox(height: 16.0),

              // Ingredients
              Text(
                'Ingredients',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ...recipe['ingredients']
                  .map<Widget>((ingredient) => Text(
                        '- $ingredient',
                        style: TextStyle(fontSize: 18),
                      ))
                  .toList(),

              SizedBox(height: 16.0),

              // Instructions
              Text(
                'Instructions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              ...recipe['instructions']
                  .map<Widget>((instruction) => Text(
                        '• $instruction',
                        style: TextStyle(fontSize: 18),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
