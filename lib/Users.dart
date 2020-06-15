import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fotoalfonsino/Model/Model.dart';
import 'package:fotoalfonsino/Service/Service.dart';

class Users extends StatefulWidget{
  Users({Key key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xff232426),
      ),
      body: FutureBuilder<List<Utente>>(
        future: Service.fetchUtente(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${snapshot.data[index].username}',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        '${snapshot.data[index].email}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }else if(snapshot.hasError){
            return Text('ERRORE');
          }
          return Center( child: CircularProgressIndicator());
        },
      ),
      backgroundColor: Color(0xff18191a),
    );
  }
}