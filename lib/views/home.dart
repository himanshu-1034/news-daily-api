import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_news/helper/data.dart';
import 'package:daily_news/helper/news.dart';
import 'package:daily_news/models/article_model.dart';
import 'package:daily_news/models/categorymodel.dart';
import 'package:daily_news/views/article_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categorymodel> categories = new List<Categorymodel>();
  List<Articlemodel> articles = new List<Articlemodel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getcategories();
  getarticles();
  }
  getarticles() async{
    News newz = News();
    await newz.getNews();
    articles = newz.news;
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
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(

          ),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              Container(

                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index){
                      return Categorytile(
                        imageurl: categories[index].imageurl,
                        categoryname: categories[index].categoryname,
                      );
                    },

                ),
              ),
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

class Categorytile extends StatelessWidget {
  final String imageurl , categoryname;
  Categorytile({this.imageurl,this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Categorynews(
          categoryname: categoryname.toLowerCase(),
        )
         ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(imageurl,width: 120,height: 60,fit: BoxFit.cover,),
        ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(categoryname,style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              ),
            ),
          ],
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
