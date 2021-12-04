import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inframe/Widgets/chat_item.dart';
import 'package:inframe/Widgets/seeker_inbox_chat_item.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/inbox_chat.dart';

class SeekerInboxChats extends StatefulWidget {
  String reciverId;
  SeekerInboxChats(this.reciverId);

  @override
  _SeekerInboxChats createState() => _SeekerInboxChats();
}

class _SeekerInboxChats extends State<SeekerInboxChats> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  String myName = "";
  String PGname = "";
  

  @override
  initState() {
    
    var ref = FirebaseDatabase.instance
        .reference()
        .child("user")
        .child(widget.reciverId);
    ref.once().then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        setState(() {
          PGname = snapshot.value["photographername"].toString();
        });
      }
    });

    // get the current user name
    FirebaseDatabase.instance
        .reference()
        .child("Seekers")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.exists) {
        myName = snapshot.value["name"].toString();
      }
    });
  
  }

  var chatEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var chatRef = FirebaseDatabase.instance.reference().child("InboxChat");
    

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
                        child: PGname != "" ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(

                              child: Text(PGname
                                      .toString()
                                      .substring(0, 1)
                                 ),
                            ),
                            const SizedBox(width: 10,),
                            Text(PGname
                                .toString(),
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ):CircularProgressIndicator()
                    ),
                  ),
              ],
            ),
            StreamBuilder(
                stream: chatRef.onValue,
                builder: (context, snapshot) {
                  final List<InboxChat> chatList = [];
                  if (snapshot.hasData) {
                    final questionMap = Map<String, dynamic>.from(
                        (snapshot.data! as Event).snapshot.value);
                    questionMap.forEach((key, value) {
                      final chatItem = Map<String, dynamic>.from(value);
                      final chatModel = InboxChat.fromRTDB(chatItem);
                      if (chatItem["inboxId"] == uid + widget.reciverId) {
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
                            SeekerInboxChatItem(chatList[index])),
                  );
                }),
            SizedBox(
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
                          .child(uid + widget.reciverId);
                     
                        iref.update({
                          "inboxId": iref.key.toString(),
                          "lastMSG": myName+": "+chatEditingController.text,
                          "seekerUid": uid,
                          "PGUid": widget.reciverId,
                          "seekerName": myName,
                          "pgName": PGname
                        }).then((value) {
                          chatRef.push().update({
                            "inboxId": uid + widget.reciverId,
                            "text": chatEditingController.text,
                            "seekerUid": uid,
                            "PGUid": widget.reciverId,
                            "sender": "seeker"
                          }).then((value){
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
