import 'package:flutter/material.dart';
import 'package:min_chat_app/components/my_drawer.dart';
import 'package:min_chat_app/components/user_tile.dart';
import 'package:min_chat_app/pages/chat_page.dart';
import 'package:min_chat_app/services/auth/auth_service.dart';
import 'package:min_chat_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users except the current user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        // return a list view of users
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      }
    );
  }

  // build individual user list item
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users except the current user (by 'uid')
    if (userData['uid'] != _authService.getCurrentUser()?.uid) {
      return UserTile(
        text: userData['email'],
        onTap:() {
          // tapped on a user -> go to chat page
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData['email'],
                receiverID: userData['uid'],
              )
            )
          );
        }
      );
    } else{
      return Container();
    }
  }
}
