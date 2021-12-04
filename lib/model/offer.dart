class Offer{
  final String amount, bidId,dateTime,description,offerId,uid, name;
  Offer(this.amount,this.bidId,this.dateTime,this.description,this.offerId,this.uid, this.name);
  factory Offer.fromRTDB(Map<String, dynamic> offerItem){
    return Offer(
      offerItem["amount"],
      offerItem["bidId"],
      offerItem["dateTime"],
      offerItem["description"],
      offerItem["offerId"],
      offerItem["uid"],
      offerItem['name']
    );
  }
}