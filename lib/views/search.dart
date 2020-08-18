import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;


class Search extends StatefulWidget {

final String searchQuery;

  Search({Key key, this.searchQuery});


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

        TextEditingController searchController = new TextEditingController();
        List<WallpaperModel> wallpapers = new List();


        getSearchWallpapers(String query) async {
        var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=16&page=1",
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
    getSearchWallpapers(widget.searchQuery);
      super.initState();
      searchController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: brandName(), 
        elevation: 0.0, 
        backgroundColor: Colors.white
      ),

      body: SingleChildScrollView(
              child: Container(
          child: Column(children: <Widget>[
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
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Wallpaper",
                      )),
                    ),
                    GestureDetector(
                      onTap: (){
                        getSearchWallpapers(searchController.text);
                        
                      },
                      child: Icon(Icons.search)),
                  ],
                ),
              ),
                      SizedBox(height: 15),
                      WallpaperList(wallpapers: wallpapers, context: context),
          ],)
        ),
      ),
      
    );
  }
}