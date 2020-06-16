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
    final responseUsers = await http.get(
      'http://jsonplaceholder.typicode.com/users'
    );

    if(responseUsers.statusCode == 200){
      List<dynamic> respUsr = json.decode(responseUsers.body);
      List<User> usrList = new List();
      for(var usr_list in respUsr){
        usrList.add(User.fromJson(usr_list));
      }
      return usrList;
    }else{
      throw Exception('ERRORE');
    }
  }//fetchUtente

  static Future<List<Post>> fetchPost({userId}) async{
    var uriString = Uri.http('https://jsonplaceholder.typicode.com','/post',{
      'userId': userId
    });
    final responsePosts = await http.get(uriString);
    if(responsePosts.statusCode == 200){
      List<dynamic> respPost = json.decode(responsePosts.body);
      List<Post> postList = new List();
      for(var post_list in respPost){
        postList.add(Post.fromJson(post_list));
      }
      return postList;
    }else{
      throw Exception('ERRORE POST');
    }
  }//fetchPost
}