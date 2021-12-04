import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/inbox.dart';
import 'package:inframe/screens/seeker_path/seeker_inbox_chat.dart';

class SeekerInboxItem extends StatelessWidget {
  Inbox inbox;
  SeekerInboxItem(this.inbox);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: GestureDetector(
        onTap: (){
          Get.to(()=>SeekerInboxChats(inbox.PGUid));
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
                  child: Text(inbox.pgName.substring(0,1)),
                ),
              title: Text(inbox.pgName),
              subtitle: Text(inbox.lastMSG),
            ),
          ),
        ),
      ),
    );
  }
}
