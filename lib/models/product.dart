import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String from;
  final String to;
  final String price;
  final String no;
  final String time;
  final List<String> images;
  final String? id;

  
  Product({
    required this.name,
    required this.from,
    required this.to,
    required this.price,
    required this.no,
    required this.time,
    required this.images,
    required this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'from': from,
      'to': to,
      'price': price,
      'no': no,
      'time': time,
      'images': images,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      from: map['from'] ?? '',
      to: map['to'] ?? '',
      price: map['price'] ?? '',
      no: map['no'] ?? '',
      time: map['time'] ?? '',
      images: List<String>.from(map['images']),
      id: map['_id'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
