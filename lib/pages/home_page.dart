import 'package:chatty/components/favorite_item.dart';
import 'package:chatty/models/message.dart';
import 'package:chatty/models/user.dart';
import 'package:chatty/pages/chats_page.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../components/message_item.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<String> tabs = ["Messages", "Online", "Groups", "Request"];
  //final dio = Dio();
  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void gotoChatScreen(User user) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChatsPage(user: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          "Chatty",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: Container(
        //padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Column(
            children: [
              Container(
                color: yellowAccentColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Favorite Contacts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(right: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final user = favorites[index];
                          return FavoriteItem(
                            user: user,
                            onPressed: () {
                              gotoChatScreen(user);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: messages.length,
                    primary: true,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return MessageItem(
                        message: message,
                        onPressed: () {
                          gotoChatScreen(message.sender);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
