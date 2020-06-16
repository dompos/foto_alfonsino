import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fotoalfonsino/Model/Model.dart';
import 'package:fotoalfonsino/Service/Service.dart';

class UsersDetail extends StatefulWidget{
  var userId;


  UsersDetail(this.userId);

  @override
  _UsersDetailState createState() => _UsersDetailState(userId);
}

class _UsersDetailState extends State<UsersDetail>{
  var userId;


  _UsersDetailState(this.userId);

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
      body: FutureBuilder<List<Post>>(
        future: Service.fetchPost(userId: userId),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Post Id: ${snapshot.data[index].id}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Title: ${snapshot.data[index].title}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }else if(snapshot.hasError){
            throw Exception(snapshot.error);
          }
          return Center( child: CircularProgressIndicator());
        },
      ),
    );
  }
}







