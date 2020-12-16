import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @observable
  int currentIndex = 0;

  final titles = [
    Text('Messages'),
    Text('Contacts'),
  ];

  final pageList = [
    Container(
        child: Center(
      child: Text('Page 1'),
    )),
    Container(
        child: Center(
      child: Text('Page 2'),
    )),
  ];

  @action
  void changePage(value) => currentIndex = value;
}
