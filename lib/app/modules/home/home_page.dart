import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            return controller.titles[controller.currentIndex];
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          return controller.pageList[controller.currentIndex];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.search,
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (index) => controller.changePage(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Contacts',
              ),
            ],
          );
        },
      ),
    );
  }
}
