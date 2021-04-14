import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  SwitchWidget({Key key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool onOff = false;
  String currencies = '\$';
  int duration = 150;

  void _goAction() {
    setState(() {
      onOff = !onOff;
      currencies = (currencies == '\$') ? 'U\$S' : '\$';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goAction(),
      onHorizontalDragEnd: (_) => _goAction(),
      child: Stack(
        children: [
          Container(
            width: 90,
            height: 30,
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'U\$S',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: duration),
            top: 0,
            left: !onOff ? 0 : 40,
            child: Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: duration),
                  child: Text(
                    '$currencies',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  key: Key(currencies),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
