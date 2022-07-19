import 'package:coffe_project/util/coffee_tile.dart';
import 'package:coffe_project/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// list of coffee types
  final List coffeeType = [
    // coffee type, isSelected
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

// user tapped on coffee types

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: Column(
        children: [
          //Fin the best coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Fin the best coffe for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffe...',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          //horizontal
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      },
                    );
                  })),

          //horizontal listviewof coffe tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePatch: 'lib/images/latte.jpg',
                coffeeName: 'Latte',
                coffeeDescription: 'Coffee drink based on milk.',
                coffeePrice: '3.80',
              ),
              CoffeeTile(
                coffeeImagePatch: 'lib/images/cappucino.png',
                coffeeName: 'Cappucino',
                coffeeDescription: 'Espresso-based coffee drink of Italian cuisine.',
                coffeePrice: '4.50',
              ),
              CoffeeTile(
                coffeeImagePatch: 'lib/images/milk.jpg',
                coffeeName: 'Milk',
                coffeeDescription: 'Natural milk, fat content 6%.',
                coffeePrice: '2.50',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
