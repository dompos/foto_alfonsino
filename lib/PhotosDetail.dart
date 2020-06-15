import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosDetail extends StatelessWidget{
  var imgUrl, title;


  PhotosDetail(this.imgUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff18191a),
      appBar: AppBar(
        title: Text(
          'Photos Details',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xff232426),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.network(imgUrl),
          Text(title, style: TextStyle(color: Colors.white70),),
        ],
      ),
    );
  }
}