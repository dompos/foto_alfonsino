class Img {
  var albumId, id, title, url, thumbnailUrl;


  Img({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Img.fromJson(Map<String, dynamic> json){
    return Img(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

}