import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  var _chat;
  ChatItem(this._chat);
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return
        Row(
          children: [
            _chat.userType == "User"?
            Spacer():
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: _chat.userType == "User" ? Radius.circular(10) : Radius.zero,
                    bottomRight: _chat.userType == "Admin" ? Radius.circular(10) : Radius.zero,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(_chat.text, style: TextStyle(fontSize: 19),),
                ),
              ),
            ),
            _chat.userType == "Admin" ?
            Spacer():
            SizedBox(),
          ],
        );
  }
}
