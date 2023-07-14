// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String name;
  final String imgUrl;
  const User({
    required this.id,
    required this.name,
    required this.imgUrl,
  });

  User copyWith({
    int? id,
    String? name,
    String? imgUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      imgUrl: (map["imgUrl"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, name: $name, imgUrl: $imgUrl)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.imgUrl == imgUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imgUrl.hashCode;
}

const currentUser =
    User(id: 0, name: "Wizkid", imgUrl: "assets/images/wizkid.jpg");

const List<User> favorites = [
  User(id: 0, name: "Wizkid", imgUrl: "assets/images/wizkid.jpg"),
  User(id: 1, name: "Davido", imgUrl: "assets/images/davido.jpg"),
  User(id: 2, name: "Burna Boy", imgUrl: "assets/images/burnaboy.jpg"),
  User(id: 3, name: "Wande Coal", imgUrl: "assets/images/wandecoal.jpg"),
  User(id: 4, name: "Olamide", imgUrl: "assets/images/olamide.jpg"),
  User(id: 5, name: "Zinoleesky", imgUrl: "assets/images/zino.jpg"),
  User(id: 6, name: "Asake", imgUrl: "assets/images/asake.jpg"),
  User(id: 7, name: "Rema", imgUrl: "assets/images/rema.jpg"),
  User(id: 8, name: "Joeboy", imgUrl: "assets/images/joeboy.jpg"),
  User(id: 9, name: "Fireboy", imgUrl: "assets/images/fireboy.jpg"),
];
