import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/inbox.dart';
import 'package:inframe/screens/photographer_path/photographer_inbox_chat.dart';

class PGInboxItem extends StatelessWidget {
  Inbox inbox;
  PGInboxItem(this.inbox);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: GestureDetector(
        onTap: (){
          Get.to(()=>PGInboxChats(inbox.seekerUid, inbox.inboxId));
        },
        child: Card(
          elevation: 5,
          color: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: kMain,
                  child: Text(inbox.seekerName.substring(0,1)),
                ),
              title: Text(inbox.seekerName),
              subtitle: Text(inbox.lastMSG),
            ),
          ),
        ),
      ),
    );
  }
}
