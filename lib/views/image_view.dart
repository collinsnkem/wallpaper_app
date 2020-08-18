

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

//import 'package:random_string/random_string.dart';
//import 'package:cached_network_image/cached_network_image.dart';


class ImageView extends StatefulWidget {

  final String imgUrl;

  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  var filePath;          

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Hero(
          tag: widget.imgUrl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            child: Image.network(
              widget.imgUrl, 
              fit: BoxFit.cover,)),
        ),

            Container(
               height: MediaQuery.of(context).size.height,
            width:  MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        _save();
                       // Navigator.pop(context);
                      },
                            child: Stack(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width/2,
                            color: Color(0xff1C1B1B).withOpacity(0.8),
                          ),
                          Container(
                            height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Color(0x36FFFFFF),
                          Color(0x0FFFFFFF)
                        ] )
                  ),
                  child: Column(
                        children: <Widget>[
                          Text("Set Wallpaper", 
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700)),
                           SizedBox(height: 8),
                          Text("image will be saved in gallery",
                          style: TextStyle(fontSize: 10, color: Colors.white)
                          )
                        ],
                  )
                ),
                        ],
                      ),
                    ),
                 SizedBox(height: 15),
                Text("Cancel", style: TextStyle(color: Colors.white)),

                    SizedBox(height: 50),

              ],)
            )     
      ],)
      
    );
  }

    _save() async {
      if(Platform.isAndroid){
        await _askPermission();
      }
      await _askPermission();
      var response = await Dio().get(
        widget.imgUrl,
        options: Options(responseType: ResponseType.bytes)
      );

      final result = 
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      print(result);
     // Navigator.pop(context);
      
    }

    _askPermission() async {
      if (Platform.isIOS) {
        Map<PermissionGroup, PermissionStatus> permissions = 
        await PermissionHandler().requestPermissions([PermissionGroup.photos]);
        
            
      } else {
        
         PermissionStatus permission =  
         await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
        //PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

      
      }
    }


}