import 'package:flutter/material.dart';
import 'package:trendy_fashion/screen/home.dart';
import 'package:animate_do/animate_do.dart';
import 'package:line_icons/line_icons.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:trendy_fashion/screen/search.dart';
import 'package:trendy_fashion/utils/constants.dart';
class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index=0;
   bool isSearchActive=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title:isSearchActive?   FadeIn(
          delay: Duration(milliseconds: 300),
          child: const Text(
            'Search',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ):FadeIn(
          delay: Duration(milliseconds: 300),
          child: const Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive=!isSearchActive;
              });
            },
            icon:isSearchActive?  const Icon(
              LineIcons.searchMinus,
              size: 30,
              color: Colors.purple,
            ):const Icon(
              LineIcons.search,
              size: 30,
              color: Colors.purple,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.shoppingBag,
              size: 30,
              color: Colors.purple,
            ),
          ),
        ],
      ),
      body:isSearchActive? Search():  Home(),
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
        selectedIndex: _index,
        items: [
           BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
        onSelect: (index){
          
        },

      )

    );
  }
}
