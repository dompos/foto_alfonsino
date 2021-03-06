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

}//Img

class User {
  var id, name, username, email, phone, website;
  Address address;
  Company company;

  User({this.id, this.name, this.username, this.email, this.phone,
      this.website, this.address, this.company});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id:  json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: new Address(),
      company: new Company(),
    );
  }
}//Utente

class Address {
  var street, suite, city, zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String,dynamic> json){
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: new Geo(),
    );
  }
}//Address

class Geo {
  var lat, lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String,dynamic> json){
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}//Geo

class Company {
  var name, catchPhrase, bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String,dynamic> json){
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}//Company

class Post {
  var userId, id, title, body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}//Post

