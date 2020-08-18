import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/categories.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:wallpaper_app/views/search.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
      List<CategoriesModel> categories = new List();
      List<WallpaperModel> wallpapers = new List();
      TextEditingController searchController = new TextEditingController();

      getTrendingWallpapers() async {
        var response = await http.get("https://api.pexels.com/v1/curated?per_page=20&page=1",
        headers:{
          "Authorization": apiKey 
        });

        //print(response.body.toString());

        Map<String, dynamic> jsonData = jsonDecode(response.body);
        jsonData["photos"].forEach((element){
          //print(element);
          
          WallpaperModel wallpaperModel = new WallpaperModel();
          wallpaperModel = WallpaperModel.fromMap(element);
          wallpapers.add(wallpaperModel);

        });

        setState(() {
          
        });
      }


@override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: brandName(), elevation: 0.0, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Container(
            child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(25.0)),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Wallpaper",
                    )),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                        searchQuery: searchController.text,
                      )));
                    },
                    child: Icon(Icons.search)),
                ],
              ),
            ),

            SizedBox(height: 16,),
            Container(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 22),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return CategorieTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index].imgUrl,
                  );
                }),
            ),

            SizedBox(height: 15),
            WallpaperList(wallpapers: wallpapers, context: context),
          ],
        )),
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {

final String imgUrl, title;

   CategorieTile({@required this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Categorie(
                  categorieName: title.toLowerCase(),)
                  
              ));
            },

          child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover),
          ),

          Container(
            color: Colors.black38,
            height: 50, width: 100,
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(
           fontWeight: FontWeight.bold,
           color: Colors.white,
           fontSize: 16),
            ),
            ),
        ],)
      ),
    );
  }
}
