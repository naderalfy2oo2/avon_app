import 'package:avon_app/core/components/app_image.dart';
import 'package:flutter/material.dart';

import 'home/pages/categories.dart';
import 'home/pages/home.dart';
import 'home/pages/my_cart.dart';
import 'home/pages/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int CurrentIndex = 0;

  final list = [
    _model(icon: 'home.svg', page: HomePage()),
    _model(icon: 'categories.svg', page: CategoriesPage()),
    _model(icon: 'my_cart.svg', page: MyCartPage()),
    _model(icon: 'profile.svg', page: ProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[CurrentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),

            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            CurrentIndex = value;
            setState(() {});
          },
          currentIndex: CurrentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: List.generate(
            list.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                image: list[index].icon,
                color: CurrentIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
              ),
              label: "",
            ),
          ),
        ),
      ),
    );
  }
}

class _model {
  final String icon;
  final Widget page;

  _model({required this.icon, required this.page});
}
