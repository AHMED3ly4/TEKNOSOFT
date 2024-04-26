import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/account/presentation/widgets/account_tab.dart';
import 'package:e_commerce/features/favourite/presentation/widgets/favourite_tab.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_tab.dart';
import 'package:e_commerce/features/home/presentation/widgets/navBarIcon.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductsTab(),
    FavouriteTab(),
    AccountTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.blueColor,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: NavBarIcon(
                iconPath: "assets/images/home_icon.png",
                isSelected: currentIndex == 0,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Categories',
              icon: NavBarIcon(
                iconPath: "assets/images/categories_icon.png",
                isSelected: currentIndex == 1,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favourite',
              icon: NavBarIcon(
                iconPath: "assets/images/favourite_icon.png",
                isSelected: currentIndex == 2,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Person',
              icon: NavBarIcon(
                iconPath: "assets/images/person_icon.png",
                isSelected: currentIndex == 3,
              ),
            ),
          ]),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: tabs[currentIndex],
      )),
    );
  }
}
