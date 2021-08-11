import 'package:flutter/material.dart';
import 'package:flutter_news/article_page.dart';

class BlogTile extends StatelessWidget {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  const BlogTile({Key key,this.title,this.description,this.url,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 2),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlePage(pageUrl: url,)));
        },
        child: Container(
          height: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            children: [
              Image.network(imageUrl!=null?imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvl4gjau98XfM4Vqu-k24b7zZSm18wT2cWsA&usqp=CAU',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 150,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 5,bottom: 5),
                child: Text(title!=null?title:'...',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500,),overflow: TextOverflow.visible,),
              ),
              SizedBox(height: 8),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(bottom: 5,left: 5),
                child: Text(description!=null?description:'....',style:TextStyle(fontSize: 16,color: Colors.grey[500],fontWeight: FontWeight.w400),maxLines: 2,overflow: TextOverflow.ellipsis),
              )),
            ],
          ),
        ),
      ),
    );
  }
}


