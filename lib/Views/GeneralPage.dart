import 'package:flutter/material.dart';
import 'package:rfk/Views/HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rfk/Views/NewsPage.dart';
import 'package:rfk/Views/PetitionsPage.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    NewsPage(),
    const Text(
      'Index 3: Enseñanza',
      style: optionStyle,
    ),
    PetitionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(_selectedIndex == 0
            ? "Home"
            : _selectedIndex == 1
                ? "Noticias"
                : _selectedIndex == 2
                    ? "Enseñanzas"
                    : "Peticiones"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.earthAmericas),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookOpen),
            label: 'Enseñanzas',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handsPraying),
            label: 'Peticiones',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffc29b61),
        onTap: _onItemTapped,
      ),
    );
  }
}
