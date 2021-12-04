import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/model/bid.dart';
import 'package:inframe/screens/photographer_path/photographer_send_bid.dart';
import 'package:inframe/screens/seeker_path/seeker_check_offers.dart';

import '../color_constants.dart';

class BidItem extends StatefulWidget {
  Bid _bid;
  String from;
  BidItem(this._bid,this.from);

  @override
  _BidItemState createState() => _BidItemState();
}

class _BidItemState extends State<BidItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding:
        const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Card(
          elevation: 5,
          color: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ExpansionTile(
            title:Text(
              widget._bid.eventType,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF707070),
              ),
            ),
            children: <Widget>[
              Stack(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Venue: ${widget._bid.eventPlace}"),
                        ),
                        Padding(
                            padding:
                            const EdgeInsets.only(right: 10),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/persons.png",
                                  scale: 2.5,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(widget._bid.numOfPeople)
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Date: ${widget._bid.eventDate}"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                          Text("Contact Person: ${widget._bid.name} ${widget._bid.phone}"),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child:
                          Text("budget: ${widget._bid.price}"),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, top: 140),
                      child: ElevatedButton(
                        onPressed: () => {
                          if(widget.from=="PG"){
                            Get.to(PGSendBid(widget._bid.bidId))
                          }else{
                            Get.to(SeekerCheckOffers(widget._bid.bidId))
                          }
                        },
                        child: Text(widget.from=="PG" ? 'Send Bid' : 'Show Offers'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 20),
                          primary: kMain,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
