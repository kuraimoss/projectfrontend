import 'package:flutter/material.dart';
import 'package:project/Provider/provider.dart';
import 'package:project/body_component/listImage.dart';
import 'package:project/body_component/message.dart';
import 'package:project/body_component/random.dart';
import 'package:provider/provider.dart';

class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  List<Widget> _body = [
    listImage(),
    MyListChat(),
    MyTask(),
  ];

  final List<IconData> _fabIcons = [
    Icons.add,
    Icons.remove,
    Icons.close,
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<myProv>(context);
    PageController _pageController =
        PageController(initialPage: provider.bnIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Navigation'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              Positioned(
                top: 12,
                right: 8,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber),
                  child: Text(
                    "${provider.totalNotif}",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                provider.resetNotif();
              },
              icon: Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.setTotalNotif(1);
        },
        child: Icon(_fabIcons[provider.bnIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.bnIndex,
          onTap: (value) {
            provider.bnIndex = value;
            _pageController.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: "Gallery"),
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
