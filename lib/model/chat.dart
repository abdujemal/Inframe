class Chat{
  final String id, text, userType;
  Chat(this.id,this.text, this.userType);
  factory Chat.fromRTDB(Map<String, dynamic> chatItem){
    return Chat(chatItem['id'],chatItem['text'],chatItem["userType"]);
  }
}