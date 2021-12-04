import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inframe/Widgets/pg_inbox_chat_item.dart';
import 'package:inframe/Widgets/pg_inbox_item.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/inbox.dart';

class PGInbox extends StatelessWidget {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  var inboxRef = FirebaseDatabase.instance.reference().child("Inbox");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                      ),
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
                StreamBuilder(
                    stream: inboxRef.onValue,
                    builder: (context, snapshot) {
                      final List<Inbox> inboxList = [];
                      if (snapshot.hasData) {
                        final questionMap = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        questionMap.forEach((key, value) {
                          final inboxItem = Map<String, dynamic>.from(value);
                          final inboxModel = Inbox.fromRTDB(inboxItem);
                          if (inboxItem["PGUid"] == uid) {
                            inboxList.add(inboxModel);
                          }
                        });
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              // controller: ScrollController(initialScrollOffset: 5),
                              itemCount: inboxList.length,
                              itemBuilder: (context, index) =>
                                  PGInboxItem(inboxList[index])),
                        ),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
