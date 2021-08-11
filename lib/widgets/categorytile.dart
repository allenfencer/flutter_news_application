import 'package:flutter/material.dart';
import 'package:flutter_news/category_news.dart';

class CategoryTile extends StatelessWidget {
  final imageUrl;
  final categoryName;
  const CategoryTile({Key key,this.imageUrl,this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      height: 70,
      width: 140,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(generatedCategory: categoryName.toString().toLowerCase(),)));
              print(categoryName);
              //TODO: add onclick functionality for categories
            },
              child: Image.network(imageUrl,width: 140,height: 70,fit: BoxFit.cover,)),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(categoryName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black45,),overflow: TextOverflow.ellipsis,)
          ),
        ],
      ),
    );
  }
}
