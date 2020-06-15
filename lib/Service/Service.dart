import 'dart:convert';
import '../Model/Model.dart';
import 'package:http/http.dart' as http;

class Service{

  static Future<List<Img>> fetchImg() async{
    final response = await http.get(
      'http://jsonplaceholder.typicode.com/photos'
    );

    if (response.statusCode == 200){
      List<dynamic> list = json.decode(response.body);
      List<Img> imgList = new List();
      for(var image_list in list){
        imgList.add(Img.fromJson(image_list));
      }
      return imgList;
    }else{
      throw Exception('ERRORE');
    }
  }//fetchImg

  static Future<List<User>> fetchUtente() async{
    final response = await http.get(
      'http://jsonplaceholder.typicode.com/users'
    );
    final responsePost = await http.get(
      'http://jsonplaceholder.typicode.com/posts'
    );

    if(response.statusCode == 200 && responsePost.statusCode == 200){
      List<dynamic> respList = json.decode(response.body);
      List<dynamic> postRespList = json.decode(responsePost.body);
      List<Utente> utnList = new List();
      List<Post> postList = new List();
      List<User> usrList = new List();
      for(var usr_list in respList){
        utnList.add(Utente.fromJson(usr_list));
      }
      for(var post_list in postRespList){
        postList.add(Post.fromJson(post_list));
      }
      for(var i = 0; i < utnList.length; i++){
        List<Post> newPost = new List();
        for(var j = 0; j < 10; j++){
          newPost.add(postList[0]);
          postList.remove(postList[0]);
        }
        usrList.add(User(utente: utnList[i], post: newPost));
      }
      return usrList;
    }else{
      throw Exception('ERRORE');
    }
  }//fetchUtente

}