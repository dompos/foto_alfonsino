import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fotoalfonsino/Service/Service.dart';
import 'package:fotoalfonsino/Model/Model.dart';
import 'package:fotoalfonsino/PhotosDetail.dart';



class Photos extends StatefulWidget{
  Photos({Key key}) : super(key: key);
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18191a),
      appBar: AppBar(
        title: Text('Photos', style: TextStyle(color: Colors.white70),),
        backgroundColor: Color(0xff232426),
      ),
      body: FutureBuilder<List<Img>>(
        future: Service.fetchImg(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhotosDetail('${snapshot.data[index].url}', '${snapshot.data[index].title}')),
                        )
                        },
                        child: Image.network('${snapshot.data[index].thumbnailUrl}'),
                      );
                    },
                    childCount: snapshot.data.length,
                  ),
                ),
              ],
            );
          }else if(snapshot.hasError){
            return Text(snapshot.error);
          }
          return Center( child: CircularProgressIndicator());
        },
      ),
    );
  }
}