import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inframe/Widgets/chat_item.dart';
import 'package:inframe/Widgets/pg_inbox_chat_item.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/inbox_chat.dart';

class PGInboxChats extends StatefulWidget {
  String reciverId, inboxId;
  PGInboxChats(this.reciverId, this.inboxId);

  @override
  _PGInboxChats createState() => _PGInboxChats();
}

class _PGInboxChats extends State<PGInboxChats> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  String myName = "";
  String skName = "";

  @override
  initState() {

    var ref = FirebaseDatabase.instance
        .reference()
        .child("Seekers")
        .child(widget.reciverId);
    ref.once().then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        setState(() {
          skName = snapshot.value["name"].toString();
        });
      }
    });

    // get the current user name
    FirebaseDatabase.instance
        .reference()
        .child("user")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        myName = snapshot.value["photographername"].toString();
      }
    });
  }

  var chatEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var chatRef = FirebaseDatabase.instance.reference().child("InboxChat");
    int numOfChat = 10;

    return Scaffold(
      backgroundColor: Color(0xF5F5F5FF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: kMain,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 80)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                      ),
                      child: skName == ""
                          ? CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(

                                  child: Text(skName
                                      .toString()
                                      .substring(0, 1)),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  skName,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            )),
                )
              ],
            ),
            StreamBuilder(
                stream: chatRef.limitToFirst(numOfChat).onValue,
                builder: (context, snapshot) {
                  final List<InboxChat> chatList = [];
                  if (snapshot.hasData) {
                    final questionMap = Map<String, dynamic>.from(
                        (snapshot.data! as Event).snapshot.value);
                    questionMap.forEach((key, value) {
                      final chatItem = Map<String, dynamic>.from(value);
                      final chatModel = InboxChat.fromRTDB(chatItem);
                      if (chatItem["inboxId"] == widget.inboxId) {
                        chatList.add(chatModel);
                      }
                    });
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        // controller: ScrollController(initialScrollOffset: 5),
                        itemCount: chatList.length,
                        itemBuilder: (context, index) =>
                            PGInboxChatItem(chatList[index])),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextField(
                      controller: chatEditingController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        hintText: "",
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(80),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (chatEditingController.text.isNotEmpty) {
                      var iref = FirebaseDatabase.instance
                          .reference()
                          .child("Inbox")
                          .child(widget.inboxId);

                      iref.update({
                        "inboxId": iref.key.toString(),
                        "lastMSG": myName+": "+chatEditingController.text,
                        "seekerUid": widget.reciverId,
                        "PGUid": uid,
                        "seekerName": skName,
                        "pgName": myName
                      }).then((value) {
                        chatRef.push().update({
                          "inboxId": widget.inboxId,
                          "text": chatEditingController.text,
                          "seekerUid": widget.reciverId,
                          "PGUid": uid,
                          "sender": "PG"
                        }).then((value) {
                          chatEditingController.text = "";
                        });
                      });
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
