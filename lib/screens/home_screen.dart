import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_travel_app/widgets/hotel_carousel.dart';

import '../widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    const width = 60.0;
    const height = 60.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(width / 2)),
        child: Icon(_icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFFB4C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 100.0),
                child: Text(
                  "What would you like to find?",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map(
                      (MapEntry map) => _buildIcon(
                        map.key,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              const DestinationCarousel(),
              const SizedBox(height: 20.0),
              const HotelCarousel(),
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
          },
          currentIndex: _currentTab,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.search, size: 30),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.local_pizza, size: 30),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/woman_smiling.jpg")),
            ),
          ]),
    );
  }
}
