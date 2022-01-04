import 'package:flutter/material.dart';

import './photo_screen.dart';
import './post_screen.dart';

import './widgets/drawer_widget.dart';
import './widgets/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenindex = 0;
  List<Widget> screens = const [
    PhotoScreen(),
    PostScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(
              titel: "Home",
            ),
            Expanded(
              child: IndexedStack(
                index: screenindex,
                sizing: StackFit.expand,
                children: screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenindex,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.image,
            ),
            label: "Image's",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_album_rounded,
              ),
              label: "Post's"),
        ],
        onTap: (index) {
          setState(() {
            screenindex = index;
          });
        },
      ),
    );
  }
}
