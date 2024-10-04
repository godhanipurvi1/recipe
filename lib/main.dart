import 'package:flutter/material.dart';

import 'Screens/detailpage.dart';
import 'Screens/favpage.dart';
import 'Screens/homepage.dart';
import 'Screens/mealpage.dart';
import 'Screens/recipepage.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detailpage': (context) => DetailPage(),
        '/mealpage': (context) => MealPage(),
        '/favouritepage': (context) => Favouritpage(),
        '/reciepage': (context) => Recipepage(),
      },
    );
  }
}
