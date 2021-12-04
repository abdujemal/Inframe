class PG {
  final String card, city, contact, id, photographername;
  PG(this.card, this.city, this.contact, this.id, this.photographername);
  factory PG.fromRTDB(Map<String, dynamic> pgItem){
    return PG(
      pgItem["card"],
      pgItem["city"],
      pgItem["contact"],
      pgItem["id"],
      pgItem["photographername"]
    );
  }
}
