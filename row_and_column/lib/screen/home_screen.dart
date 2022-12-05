import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.black,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Expanded, Flexible 은 Column, Row 내에서만 사용할 수 있다.
                Flexible(
                  child:
                      Container(width: 50.0, height: 50.0, color: Colors.red),
                ),
                Expanded(
                  flex: 1,
                  child:
                    Container(width: 50.0, height: 50.0, color: Colors.orange),
                ),
                Expanded(
                  child:
                    Container(width: 50.0, height: 50.0, color: Colors.yellow),
                ),
                Expanded(
                  child:
                    Container(width: 50.0, height: 50.0, color: Colors.green),
                ),
              ])),
    ));
  }
}
