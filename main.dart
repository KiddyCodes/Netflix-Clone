import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mango/Screens/Comingsoon.dart';
import 'package:mango/Screens/Download.dart';
import 'package:mango/Screens/Homescreen.dart';
import 'package:mango/Screens/More.dart';
import 'package:mango/Screens/Search.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix-Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    PageController pageController = PageController();
    void onTap(int pageValue) {
      setState(() {
        selectedIndex = pageValue;
      });
      pageController.jumpToPage(pageValue);
    }

    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          selectedFontSize: 14.0,
          selectedIconTheme: IconThemeData(color: Colors.black87),
          unselectedFontSize: 12.0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('icons/home.png',
                    scale: 22.0, color: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Home',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                )),
            BottomNavigationBarItem(
                icon: Image.asset('icons/search.png',
                    scale: 22.0, color: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Search',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                )),
            BottomNavigationBarItem(
                icon: Image.asset('icons/coming.png',
                    scale: 22.0, color: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Coming soon',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                )),
            BottomNavigationBarItem(
                icon: Image.asset('icons/download.png',
                    scale: 22.0, color: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Download',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                )),
            BottomNavigationBarItem(
                icon: Image.asset('icons/more.png',
                    scale: 22.0, color: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('More',
                      style: TextStyle(color: Colors.white, fontSize: 12.0)),
                )),
          ],
          onTap: onTap,
        ),
        body: PageView(
          controller: pageController,
          children: <Widget>[
            Homescreen(),
            Search(),
            Comingsoon(),
            Download(),
            More()
          ],
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ));
  }
}
