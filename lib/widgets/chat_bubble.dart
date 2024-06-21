import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: const EdgeInsets.all(23),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(23),
            topLeft: Radius.circular(23),
            bottomRight: Radius.circular(23),
          ),
          color: kPrimaryColor,
        ),
        child: const Text(
          'What is your name',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
