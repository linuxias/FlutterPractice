import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('Widget Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('Widget createState');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;

  @override
  void initState() {
    super.initState();
    print('State : initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('State : didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('State : deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('State : dispose');
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('State : didUpdateWidget');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('State : setState');
  }

  @override
  Widget build(BuildContext context) {
    print('State: build');
    return GestureDetector(
      onTap: (){
        setState(() {number++;});
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: widget.color,
        child: Center (
          child: Text(
            number.toString()
          )
        )
      ),
    );
  }
}