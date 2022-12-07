import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer\'s Delight'),
        centerTitle: false,
        backgroundColor: Colors.orange,
      ),
      body:WebView(
        initialUrl: 'https://sonseungha.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
