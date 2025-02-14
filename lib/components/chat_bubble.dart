import 'package:flutter/material.dart';
import 'package:min_chat_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

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
    // light vs dark mode for correct bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;


    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser 
        ? (isDarkMode ? Colors.green.shade600 : Colors.grey.shade500)
        : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(7.0),
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser
            ? Colors.white
            : (isDarkMode ? Colors.white : Colors.black),
        ),
        ),

    );
    
  }
}
