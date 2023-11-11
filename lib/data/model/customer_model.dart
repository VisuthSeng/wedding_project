// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerModel {
  final String id;
  final String name;
  final String paymentType;
  final double payment;
  final String currency;
  final String side;
  CustomerModel({
    required this.id,
    required this.name,
    required this.paymentType,
    required this.payment,
    required this.currency,
    required this.side,
  });

  CustomerModel copyWith({
    String? id,
    String? name,
    String? paymentType,
    double? payment,
    String? currency,
    String? side,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      paymentType: paymentType ?? this.paymentType,
      payment: payment ?? this.payment,
      currency: currency ?? this.currency,
      side: side ?? this.side,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'paymentType': paymentType,
      'payment': payment,
      'currency': currency,
      'side': side,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as String,
      name: map['name'] as String,
      paymentType: map['paymentType'] as String,
      payment: map['payment'] as double,
      currency: map['currency'] as String,
      side: map['side'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, paymentType: $paymentType, payment: $payment, currency: $currency, side: $side)';
  }

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.paymentType == paymentType &&
        other.payment == payment &&
        other.currency == currency &&
        other.side == side;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        paymentType.hashCode ^
        payment.hashCode ^
        currency.hashCode ^
        side.hashCode;
  }
}
