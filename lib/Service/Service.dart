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
  }

}