class InboxChat{
  String seekerUid,PGUid,text,sender;
  InboxChat(this.seekerUid,this.PGUid,this.text,this.sender);
  factory InboxChat.fromRTDB(Map<String, dynamic> chatItem){
    return InboxChat(chatItem['seekerUid'],chatItem['PGUid'],chatItem["text"],chatItem["sender"]);
  }

}