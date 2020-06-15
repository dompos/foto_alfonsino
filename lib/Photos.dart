import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fotoalfonsino/Service/Service.dart';
import 'package:fotoalfonsino/Model/Model.dart';
import 'package:fotoalfonsino/PhotosDetail.dart';
import 'package:fotoalfonsino/Users.dart';


class Photos extends StatefulWidget{
  Photos({Key key}) : super(key: key);
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos>{
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      if(index == 1){
        
      }
    });
  }

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
            return Text('ERRORE');
          }
          return Center( child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            title: Text('Photos')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text('Users'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xfffabe00),
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xff232426),
      ),
    );
  }
}