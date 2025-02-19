import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:min_chat_app/models/message.dart';

class ChatService {
  // get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();
        // return user
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverID, String message) async {
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
      senderId: currentUserID,
      senderEmail: currentUserEmail,
      receiverId: receiverID,
      message: message,
      timestamp: timestamp,
    );

    //construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // sort the ids (this ensures the chat room ID is the same for any 2 people)
    String chatRoomID = ids.join('_');

    // add new message to the database
    await _firestore
        .collection('ChatRooms')
        .doc(chatRoomID)
        .collection('Messages')
        .add(newMessage.toMap());


  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    // construct chat room ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('ChatRooms')
        .doc(chatRoomID)
        .collection('Messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

}
