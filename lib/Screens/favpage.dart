import 'package:flutter/material.dart';

import 'list.dart';

class Favouritpage extends StatefulWidget {
  const Favouritpage({super.key});

  @override
  State<Favouritpage> createState() => _FavouritpageState();
}

class _FavouritpageState extends State<Favouritpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pushReplacementNamed((context), '/');
          },
        ),
        backgroundColor: Colors.white,
        title: Center(child: Text('My Favourite Recipes')),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil((context), ModalRoute.withName('/homepage'));
              setState(() {});
            },
          ),
        ],
      ),
      body: fav_items.isEmpty
          ? Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset('lib/assets/Empty.png', width: 350),
                  SizedBox(height: 10),
                  Text('No favourite recipes yet',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 12, 106),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text('Please add your favourite recipes',
                      style:
                          TextStyle(color: Color.fromARGB(255, 103, 103, 103))),
                ],
              ),
            )
          : ListView.builder(
              itemCount: fav_items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/detailPage',
                                          arguments: fav_items[index]);
                                    },
                                    child: Image.network(
                                      fav_items[index]["image"],
                                      fit: BoxFit.cover,
                                    ))),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${fav_items[index]['name']}',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 4, 12, 106),
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  fav_items.removeAt(index);
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
    );
  }
}
