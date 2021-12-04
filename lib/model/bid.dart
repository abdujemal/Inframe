class Bid{
  final String uid,eventType,eventDate,numOfPeople,phone,price,dateTime,name,eventPlace,bidId;
  Bid(this.uid,this.eventType,this.eventDate,this.numOfPeople,this.phone,this.price,this.dateTime,this.name,this.eventPlace,this.bidId);
  factory Bid.fromRTDB(Map<String, dynamic> bidItem){
    return Bid(
      bidItem["uid"],
      bidItem["eventType"],
      bidItem["eventDate"],
      bidItem["numOfPeople"],
      bidItem["phone"],
      bidItem["price"],
      bidItem["dateTime"],
      bidItem["name"],
      bidItem["eventPlace"],
      bidItem["bidId"]
    );
  }
}