// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chatty/models/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  const Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });

  Message copyWith({
    User? sender,
    String? time,
    String? text,
    bool? isLiked,
    bool? unread,
  }) {
    return Message(
      sender: sender ?? this.sender,
      time: time ?? this.time,
      text: text ?? this.text,
      isLiked: isLiked ?? this.isLiked,
      unread: unread ?? this.unread,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender.toMap(),
      'time': time,
      'text': text,
      'isLiked': isLiked,
      'unread': unread,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: User.fromMap((map["sender"] ?? Map<String, dynamic>.from({}))
          as Map<String, dynamic>),
      time: (map["time"] ?? '') as String,
      text: (map["text"] ?? '') as String,
      isLiked: (map["isLiked"] ?? false) as bool,
      unread: (map["unread"] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(sender: $sender, time: $time, text: $text, isLiked: $isLiked, unread: $unread)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.sender == sender &&
        other.time == time &&
        other.text == text &&
        other.isLiked == isLiked &&
        other.unread == unread;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        time.hashCode ^
        text.hashCode ^
        isLiked.hashCode ^
        unread.hashCode;
  }
}

List<Message> messages = [
  Message(
      sender: favorites[0],
      time: "5:30pm",
      text: "She tell me sey",
      isLiked: true,
      unread: true),
  Message(
      sender: favorites[1],
      time: "1:00pm",
      text: "Shepe. We rise by lifting others",
      isLiked: true,
      unread: true),
  Message(
      sender: favorites[2],
      time: "8:50am",
      text: "Odogwu you bad. E file fun burna",
      isLiked: true,
      unread: true),
  Message(
      sender: favorites[3],
      time: "6:30pm",
      text: "Iskaba Iskelebete. It's WC",
      isLiked: true,
      unread: false),
  Message(
      sender: favorites[4],
      time: "5:30pm",
      text: "Baddo. Oya mi lenu o",
      isLiked: true,
      unread: true),
  Message(
      sender: favorites[5],
      time: "5:30pm",
      text: "Sheun ti o fe se",
      isLiked: true,
      unread: true),
  Message(
      sender: favorites[6],
      time: "5:30pm",
      text: "Ololademi Asake",
      isLiked: false,
      unread: true),
  Message(
      sender: favorites[7],
      time: "5:30pm",
      text: "Dumebi",
      isLiked: false,
      unread: false),
  Message(
      sender: favorites[8],
      time: "5:30pm",
      text: "Joeboy",
      isLiked: false,
      unread: true),
  Message(
      sender: favorites[9],
      time: "5:30pm",
      text: "Fireboy",
      isLiked: false,
      unread: false),
];
