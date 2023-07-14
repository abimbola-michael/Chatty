// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatty/colors.dart';
import 'package:chatty/components/chat_item.dart';
import 'package:flutter/material.dart';

import '../models/message.dart';
import '../models/user.dart';

class ChatsPage extends StatefulWidget {
  final User user;
  const ChatsPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: accentColor,
              backgroundImage: AssetImage(widget.user.imgUrl),
            ),
            const SizedBox(width: 8),
            Text(widget.user.name),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  primary: true,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.sender.id == currentUser.id;
                    return ChatItem(
                      message: message,
                      isMe: isMe,
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: yellowAccentColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.attachment),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
