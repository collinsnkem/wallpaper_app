import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/image_view.dart';

Widget brandName(){
  return RichText(
   // textAlign: TextAlign.center,
  text: TextSpan(
    //text: 'Wallyn',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    children: <TextSpan>[
      TextSpan(text: 'Wallyn', style: TextStyle(color: Colors.black)),
      TextSpan(text: 'Paper', style: TextStyle(color: Colors.blue)),
    ],
  ),
);
}

Widget WallpaperList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ImageView(
                  imgUrl: wallpaper.src.portrait,
                )));
            },
                      child: Hero(
                        tag: wallpaper.src.portrait,
                    child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
                ),
            ),
          ),
            );
      }).toList()
    ),

  );
}