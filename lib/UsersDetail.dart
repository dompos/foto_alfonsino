import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fotoalfonsino/Model/Model.dart';

class UsersDetail extends StatelessWidget{
  final List<Post> post;


  UsersDetail({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18191a),
      appBar: AppBar(
        title: Text(
          'Users Details',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xff232426),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: post.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Post Id: ${post[index].id}',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'Title: ${post[index].title}',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}







