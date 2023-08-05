// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sheryrose/Pages/Developer.dart';
import 'package:sheryrose/Pages/Home.dart';

import 'Flower.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const Home(),
   const Flower(),
   const Developer(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 20,
            selectedItemColor: const Color(0XffAC7B81),
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: '',
              ),
               BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_outline,
                  size: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: '',
              ),
            ]),
      ),
    );
  }
}
