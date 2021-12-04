import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/model/pg.dart';

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
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: kMain,
                  child: Text(widget.pg.photographername.substring(0, 1)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  widget.pg.photographername,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                )
              ],
            ),
            title: Text(widget.pg.photographername),
            subtitle: Text("city: ${widget.pg.city}"),
          ),
        ),
      ),
    );
  }
}
