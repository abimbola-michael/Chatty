// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/message.dart';
import '../models/user.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final VoidCallback onPressed;
  const MessageItem({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: message.unread ? accentColor : white,
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              image: DecorationImage(
                image: AssetImage(message.sender.imgUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message.sender.name,
              style: const TextStyle(fontWeight: FontWeight.bold, color: black),
            ),
            Text(
              message.time,
              style: const TextStyle(fontSize: 14, color: lighterBlack),
            ),
          ],
        ),
        subtitle: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message.text,
                style: const TextStyle(color: black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            if (message.unread) ...[
              Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.all(4),
                child: const Text(
                  "NEW",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
