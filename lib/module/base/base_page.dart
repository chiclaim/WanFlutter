import 'package:flutter/material.dart';

abstract class BaseStatefulPage extends StatelessWidget {
  const BaseStatefulPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print("===========================${toString()}");
    return buildBody();
  }

  Widget buildBody();
}
