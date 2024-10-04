import 'package:flutter/material.dart';

import 'list.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  // Placeholder for your list of meal items

  double totalCalories() {
    double totalCalories = 0.0;

    meal_items.forEach((item) {
      totalCalories += item['caloriesPerServing'] * item['servings'];
    });

    return totalCalories;
  }

  double totalCookTime() {
    double totalCookTime = 0.0;

    meal_items.forEach((item) {
      totalCookTime += item['cookTimeMinutes'] * item['servings'];
    });

    return totalCookTime;
  }

  double totalServing() {
    double totalServing = 0.0;

    meal_items.forEach((item) {
      totalServing += item['servings'];
    });

    return totalServing;
  }

  @override
  Widget build(BuildContext context) {
    double totalCaloriesValue = totalCalories();
    double totalCookTimeValue = totalCookTime();
    double totalServingValue = totalServing();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('My Meal')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pushReplacementNamed((context), '/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: meal_items.isEmpty
          ? Center(
              child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset('lib/assets/Empty.png', width: 350),
                SizedBox(height: 10),
                Text('Meal is empty',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 12, 106),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Text('      please add recipes to meal',
                    style:
                        TextStyle(color: Color.fromARGB(255, 103, 103, 103))),
              ],
            ))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: meal_items.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        meal_items[i]["image"],
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${meal_items[i]['name']}',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 4, 12, 106),
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        meal_items.removeAt(i);
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete)),
                                ),
                              ],
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total Calories: ${totalCaloriesValue}\n'
                            'Total Cook Time: ${totalCookTimeValue} mins\n'
                            'Total Servings: ${totalServingValue}',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
