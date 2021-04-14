import 'package:flutter/material.dart';
import 'package:swichapp/src/widget/switch_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SwitchWidget(),
        ),
      ),
    );
  }
}
