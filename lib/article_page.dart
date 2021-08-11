import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  final String pageUrl;
  const ArticlePage({Key key,this.pageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',style: TextStyle(color: Colors.black45),),
            Text('News',style: TextStyle(color: Colors.blue),),
          ],
        ),leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios_outlined,color: Colors.black54,)),
          actions: [
          IconButton(
            onPressed: (){
              //TODO: SHARE FUNCTION
            },
              padding: EdgeInsets.only(right:10),
              icon: Icon(Icons.share,color: Colors.black54,),
          ),
        ],
      ),
      body: WebView(
        initialUrl: pageUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
