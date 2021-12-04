import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inframe/model/inbox_chat.dart';

class PGInboxChatItem extends StatelessWidget {
  InboxChat _chat;

  PGInboxChatItem(this._chat);
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chat.sender == "PG" ? Spacer() : SizedBox(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: _chat.sender == "PG"
                      ? Radius.circular(10)
                      : Radius.zero,
                  bottomRight: _chat.sender != "PG"
                      ? Radius.circular(10)
                      : Radius.zero,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                _chat.text,
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
        ),
        _chat.sender != "PG" ? Spacer() : SizedBox(),
      ],
    );
  }
}
