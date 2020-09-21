import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Articleview extends StatefulWidget {
  final String weburl;
  Articleview({this.weburl});
  @override
  _ArticleviewState createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Country',style: TextStyle(color: Colors.orange),),
            Text('News',style: TextStyle(
                color: Colors.green
            ),)
          ],
        ),
        actions: [
          Opacity(opacity: 0,child: Container(padding: EdgeInsets.symmetric(horizontal: 16),child: Icon(Icons.home)))
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: WebView(
          onWebViewCreated: (WebViewController webviewcontroller){
            _completer.complete(webviewcontroller);
          },
            initialUrl: widget.weburl,
        ),
      ),
    );
  }
}
