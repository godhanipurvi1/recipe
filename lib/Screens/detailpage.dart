import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300, // Adjusted height for better fit
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/reciepage',
                            arguments: recipe);
                      },
                      child: Image.network(
                        recipe["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.local_dining, color: Colors.white),
                        onPressed: () {
                          // Handle food bank button action
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe["name"],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  buildInfoCard(
                    icon: Icons.local_fire_department,
                    //color: Colors.orange,
                    text: "${recipe["caloriesPerServing"]} Calories",
                  ),
                  SizedBox(height: 8.0),
                  buildInfoCard(
                    icon: Icons.timelapse,
                    //color: Colors.yellow,
                    text: "Prep Time: ${recipe["prepTimeMinutes"]} mins",
                  ),
                  SizedBox(height: 8.0),
                  buildInfoCard(
                    icon: Icons.timer,
                    //  color: Colors.green,
                    text: "Cook Time: ${recipe["cookTimeMinutes"]} mins",
                  ),
                  SizedBox(height: 8.0),
                  buildInfoCard(
                    icon: Icons.person,
                    // color: Colors.purple,
                    text: "Serves: ${recipe["servings"]} persons",
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Difficulty: ${recipe["difficulty"]}",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Cuisine: ${recipe["cuisine"]}",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Ingredients: ${recipe["ingredients"].length}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Instructions: ${recipe["instructions"].length}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Tags:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // Wrap(
                  //   spacing: 8.0,
                  //   children: recipe["tags"]
                  //       .map<Widget>((tag) => GestureDetector(
                  //             onTap: () {
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       CategoryPage(tag: tag),
                  //                 ),
                  //               );
                  //             },
                  //             child: Chip(
                  //               label: Text(tag),
                  //             ),
                  //           ))
                  //       .toList(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(
      {required IconData icon,
      //  required Color color
      required String text}) {
    return Container(
      decoration: BoxDecoration(
        //color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              //color: color
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
