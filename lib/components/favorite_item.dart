// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/user.dart';

class FavoriteItem extends StatelessWidget {
  final User user;
  final VoidCallback onPressed;
  const FavoriteItem({
    Key? key,
    required this.user,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: accentColor,
              backgroundImage: AssetImage(user.imgUrl),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.name,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
