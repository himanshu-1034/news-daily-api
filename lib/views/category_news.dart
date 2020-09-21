import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/helper/news.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:flutter/material.dart';

import 'article_view.dart';
class Categorynews extends StatefulWidget {
  final String categoryname;
  Categorynews({this.categoryname});
  @override
  _CategorynewsState createState() => _CategorynewsState();
}

class _CategorynewsState extends State<Categorynews> {
  List<Articlemodel> articles = new List<Articlemodel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getcategoryarticles();
  }
  getcategoryarticles() async{
    CategoryNews newz = CategoryNews();
    await newz.getcategoryNews(widget.categoryname);
    articles = newz.newss;
    setState(() {
      _loading = false;
    });
  }
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
      body:_loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder:(context , index){
                      return Blogtile(imageurl: articles[index].urltoimage,title: articles[index].title, desc: articles[index].description,url: articles[index].url,);
                    } ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Blogtile extends StatelessWidget {
  final String imageurl,title,desc,url;
  Blogtile({@required this.imageurl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Articleview(weburl: url,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: imageurl),
            Text(title,style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(

                color: Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}