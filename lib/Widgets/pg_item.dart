import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/model/pg.dart';
import 'package:inframe/screens/seeker_path/seeker_inbox_chat.dart';

import '../color_constants.dart';

class PGItem extends StatefulWidget {
  PG pg;
  PGItem(this.pg);

  @override
  _PGItemState createState() => _PGItemState();
}

class _PGItemState extends State<PGItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 5,
        color: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading:CircleAvatar(
                  backgroundColor: kMain,
                  child: Text(widget.pg.photographername.substring(0, 1)),
                ),
            title: Text(widget.pg.photographername),
            subtitle: Text("city: ${widget.pg.city}"),
            trailing: GestureDetector(
              onTap: (){
                Get.to(()=>SeekerInboxChats(widget.pg.id));
              },
              child: Card(
                color: kMain,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    "Start Discussing",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
