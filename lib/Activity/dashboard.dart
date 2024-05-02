import 'package:flutter/material.dart';
import 'package:kelompok/Provider/provider.dart';
import 'package:kelompok/body_component/halsecond.dart';
import 'package:kelompok/body_component/message.dart';
import 'package:kelompok/body_component/random.dart';
import 'package:provider/provider.dart';

class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  List<Widget> _body = [
    HalSecond(),
    MyListChat(),
    MyTask(),

  ];


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProv>(context);
    PageController _pageController =
        PageController(initialPage: provider.bnIndex);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.bnIndex,
          onTap: (value) {
            provider.bnIndex = value;
            _pageController.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            
            BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Task"),
          ]),
      body: PageView(
        children: _body,
        controller: _pageController,
        onPageChanged: (value) {
          provider.bnIndex = value;
        },
      ),
    );
  }
}
