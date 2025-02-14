import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(7.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
        ),

    );
    
  }
}
