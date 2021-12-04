import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:inframe/Widgets/chat_item.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/chat.dart';

class ChatScreen extends StatelessWidget {

  ChatScreen({Key? key}) : super(key: key);

  var chatEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var chatRef = FirebaseDatabase.instance.reference().child("Chat");
    int numOfChat = 10;
    String uid = FirebaseAuth.instance.currentUser!.uid;


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
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.only(
                            top: 70,
                          ),
                          child: Text(
                            "Talk To Us!",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
                StreamBuilder(
                    stream: chatRef.limitToFirst(numOfChat).onValue,
                    builder: (context, snapshot) {
                      final List<Chat> chatList = [];
                      if (snapshot.hasData) {
                        final questionMap = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        questionMap.forEach((key, value) {
                          final questionItem = Map<String, dynamic>.from(value);
                          final questionModel = Chat.fromRTDB(questionItem);
                          if(questionItem["id"]==uid){
                            chatList.add(questionModel);
                          }
                        });
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height/1.4,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            // controller: ScrollController(initialScrollOffset: 5),
                            itemCount: chatList.length,
                            itemBuilder: (context, index) =>
                                ChatItem(chatList[index])

                          ),
                      );
                    }
                ),
                SizedBox(height: 10,),
                Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width-60,

                          child: TextField(
                            controller: chatEditingController,
                            decoration: const InputDecoration(

                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              hintText: "",
                              hintStyle:
                              TextStyle(fontSize: 16),
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
                        onPressed: (){
                          if(chatEditingController.text.isNotEmpty){
                            chatRef.push().update({
                              "id": uid,
                              "text": chatEditingController.text,
                              "userType": "User"
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
