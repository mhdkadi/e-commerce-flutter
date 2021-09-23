import 'package:e_commerce_app/view/screens/home/screens/discover/discover.dart';
import 'package:e_commerce_app/view/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavigationBarIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => setState(() {
                  _bottomNavigationBarIndex = index;
                  _pageController.animateToPage(index,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1));
                }),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            iconSize: 30,
            currentIndex: _bottomNavigationBarIndex,
            unselectedItemColor: Colors.grey[500],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            backgroundColor: Colors.grey[50],
            items: const [
              BottomNavigationBarItem(
                label: 'Discover',
                icon: Icon(Icons.auto_awesome_mosaic_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(Icons.favorite_border),
              ),
              BottomNavigationBarItem(
                label: 'Card',
                icon: Icon(Icons.shop_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: Icon(Icons.person_outline),
              ),
            ]),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _bottomNavigationBarIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Discover(),
            Center(child: Text('1')),
            Center(child: Text('3')),
            Center(child: Text('4')),
          ],
        ),
      ),
    );
  }
}
