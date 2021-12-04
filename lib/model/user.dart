import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String photograhpername;
  final String contact;
  final String card;
  final String city;
  final String? image;

  const MyUser(
      this.id, this.photograhpername, this.contact, this.card, this.city,
      {this.image});

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'photographername': photograhpername,
      'contact': contact,
      'card': card,
      'city': city,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
      : id = data['id'] as String,
        photograhpername = data['photographername'] as String,
        contact = data['contact'] as String,
        card = data['card'] as String,
        city = data['city'] as String,
        image = data['image'] as String?;
}
