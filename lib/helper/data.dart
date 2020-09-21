import 'package:daily_news/models/categorymodel.dart';

List<Categorymodel> getcategories(){
    List<Categorymodel> categories = new List<Categorymodel>();
    Categorymodel categorymodel = new Categorymodel();
    //1
    categorymodel.categoryname = "Business";
    categorymodel.imageurl = "images/business.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "Entertainment";
    categorymodel.imageurl = "images/entertainment.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "General";
    categorymodel.imageurl = "images/general.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "Health";
    categorymodel.imageurl = "images/health.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "Science";
    categorymodel.imageurl = "images/science.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "Sports";
    categorymodel.imageurl = "images/sports.jpg";
    categories.add(categorymodel);
    categorymodel = new Categorymodel();


    categorymodel.categoryname = "Technology";
    categorymodel.imageurl = "images/technology.jpg";
    categories.add(categorymodel);

    return categories;

}