import 'package:flutter/material.dart';

import 'list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isfilled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 25.0, // Adjust size as needed
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/favouritepage');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.food_bank,
                      color: Colors.black,
                      size: 25.0, // Adjust size as needed
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mealpage');
                    },
                  )
                ],
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 0.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final recipe = allRecipies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'detailpage',
                          arguments: allRecipies[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0)),
                                child: Container(
                                  height: 240,
                                  child: Image.network(
                                    recipe["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120.0, // Adjust height as needed
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8.0,
                                right: 8.0,
                                child: Container(
                                  width: 40,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (fav_items
                                            .contains(allRecipies[index])) {
                                          fav_items.remove(allRecipies[index]);
                                        } else {
                                          fav_items.add(allRecipies[index]);
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      fav_items.contains(allRecipies[index])
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          fav_items.contains(allRecipies[index])
                                              ? Color.fromARGB(255, 197, 0, 10)
                                              : Color.fromARGB(255, 197, 0, 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recipe["name"],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              4), // Space between name and calories
                                      Text(
                                        "${recipe["caloriesPerServing"]} Calories",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (meal_items
                                          .contains(allRecipies[index])) {
                                        meal_items.remove(allRecipies[index]);
                                      } else {
                                        meal_items.add(allRecipies[index]);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    meal_items.contains(allRecipies[index])
                                        ? Icons.food_bank
                                        : Icons.food_bank_outlined,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: allRecipies.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
