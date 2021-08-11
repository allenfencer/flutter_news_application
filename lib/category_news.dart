import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/blog_tile.dart';

import 'package:http/http.dart'as http;

class CategoryNews extends StatefulWidget {
  final String generatedCategory;
  const CategoryNews({Key key,this.generatedCategory}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  Map data;
  List relatedArticle;

  Future<Map> getCategoryNews(String category)async{
    String url='https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=55a177bad241441b89864b27e16a87d2';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        data=jsonDecode(response.body);
        relatedArticle=data['articles'];
        return data;
      }
    else{
      throw Exception('Cannot fetch your preferred news at the moment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',style: TextStyle(color: Colors.black54),),
            Text('News',style: TextStyle(color: Colors.blue),),
          ],
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back_ios_outlined,color: Colors.black54,)),
        actions: [
          SizedBox(height: 10,width: 25,),
        ],
      ),
      body: FutureBuilder(
        future: getCategoryNews(widget.generatedCategory),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: relatedArticle.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return BlogTile(title: relatedArticle[index]['title'],description: relatedArticle[index]['description'],url: relatedArticle[index]['url'],imageUrl: relatedArticle[index]['urlToImage'],);
                });
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
