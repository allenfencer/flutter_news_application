import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/models/categoryData.dart';
import 'package:flutter_news/widgets/blog_tile.dart';
import 'package:flutter_news/widgets/categorytile.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map output;
  List articles;

  Future<Map> getNews()async{
    String url='https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=55a177bad241441b89864b27e16a87d2';
    final response= await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        output=jsonDecode(response.body);
        articles= output['articles'];
        return output;
      }
    else{
      throw Exception('cannot connect to server at the moment');
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
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 80,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 8,right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryList.categories.length,
                    itemBuilder: (context,index){
                    return CategoryTile(imageUrl: CategoryList.categories[index].imageUrl,categoryName: CategoryList.categories[index].categoryName,);
                }),
              ),
              Container(
                child: FutureBuilder(
                  future: getNews(),
                  builder: (BuildContext context,snapshot){
                    if(snapshot.hasData)
                      {
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics:NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 4),
                              itemCount: articles.length,
                              itemBuilder: (context,index){
                                return BlogTile(title: articles[index]['title'],description: articles[index]['description'],url: articles[index]['url'],imageUrl: articles[index]['urlToImage'],);
                              }),
                        );
                      }
                    else{
                      return Center(
                        child: CircularProgressIndicator(backgroundColor:Colors.blue,),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

