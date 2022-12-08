import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  final String homeUrl = 'https://sonseungha.tistory.com';
  WebViewController? controller;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer\'s Delight'),
        centerTitle: false,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: (){
                controller?.loadUrl(homeUrl);
              },
              icon: Icon(
                Icons.home
              ))],
      ),
      body:WebView(
        onWebViewCreated: (WebViewController controller){
          this.controller = controller;
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
