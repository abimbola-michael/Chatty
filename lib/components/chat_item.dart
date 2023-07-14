// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chatty/colors.dart';

import '../models/message.dart';

class ChatItem extends StatelessWidget {
  final Message message;
  final bool isMe;
  const ChatItem({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: EdgeInsets.only(
              left: isMe ? 60 : 0, right: isMe ? 0 : 60, top: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 15 : 0),
              bottomLeft: Radius.circular(isMe ? 15 : 0),
              topRight: Radius.circular(isMe ? 0 : 15),
              bottomRight: Radius.circular(isMe ? 0 : 15),
            ),
            color: isMe ? accentColor : yellowAccentColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: lightBlack),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(message.text),
            ],
          ),
        ),
      ],
    );
  }
}
