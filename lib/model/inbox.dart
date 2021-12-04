class Inbox{
  String PGUid,inboxId,lastMSG,pgName,seekerName,seekerUid;
  Inbox(this.PGUid, this.inboxId,this.lastMSG,this.pgName,this.seekerName,this.seekerUid);
  factory Inbox.fromRTDB(Map<String,dynamic> inboxItem){
    return Inbox(inboxItem["PGUid"], inboxItem["inboxId"], inboxItem["lastMSG"], inboxItem["pgName"], inboxItem["seekerName"], inboxItem["seekerUid"]);
  }

}