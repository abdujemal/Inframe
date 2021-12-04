import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/model/offer.dart';
import 'package:inframe/screens/seeker_path/seeker_inbox_chat.dart';

import '../color_constants.dart';
class OfferItem extends StatefulWidget {
  Offer offer;
  String bidId;
  
  OfferItem(this.offer,this.bidId);

  @override
  _OfferItemState createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem> {
  final _dialogKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
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
                  child: Text(widget.offer.name.substring(0,1)),
                ),
                SizedBox(height: 2,),
                Text(widget.offer.name,style: TextStyle(color: Colors.black87,fontSize: 13),)
              ],
            ),
            title: Text("\$${widget.offer.amount}"),
            subtitle: Text(widget.offer.description),
            trailing: SizedBox(
              width: 85,
              child: GestureDetector(
                onTap: (){
                  Get.defaultDialog(
                      navigatorKey: _dialogKey,
                      title: "Confirmation",
                      middleText: "Press continue if you want to award ${widget.offer.name}?",
                      actions: [

                        ElevatedButton(

                            onPressed: (){

                              var ref = FirebaseDatabase.instance.reference().child("Bids").child(widget.bidId);
                              ref.remove().then((value){
                                var ref1 = FirebaseDatabase.instance.reference().child("Offers").child(widget.bidId);
                                ref1.remove().then((value){
                                  Get.off(()=>SeekerInboxChats(widget.offer.uid));
                                  }).onError((error, stackTrace) {
                                    Get.snackbar("Error", error.toString(), snackPosition: SnackPosition.BOTTOM);
                                });
                                });

                            },
                            child: const Text("Continue")),
                      ]
                  );
                },
                child: Card(
                  color: kMain,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const [
                        Icon(CupertinoIcons.star, color: Colors.amber,size: 18,),
                        SizedBox(width: 3,),
                        Text("Award",style: TextStyle(color: Colors.amber),)
                      ],
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
