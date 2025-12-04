import 'user.dart';

class Data {
  int? userId;
  String? amount;
  int? charge;
  int? rate;
  String? finalAmount;
  int? methodCode;
  String? methodCurrency;
  int? status;
  String? trx;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  User? user;

  Data({
    this.userId,
    this.amount,
    this.charge,
    this.rate,
    this.finalAmount,
    this.methodCode,
    this.methodCurrency,
    this.status,
    this.trx,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json['user_id'] as int?,
        amount: json['amount'] as String?,
        charge: json['charge'] as int?,
        rate: json['rate'] as int?,
        finalAmount: json['final_amount'] as String?,
        methodCode: json['method_code'] as int?,
        methodCurrency: json['method_currency'] as String?,
        status: json['status'] as int?,
        trx: json['trx'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'amount': amount,
        'charge': charge,
        'rate': rate,
        'final_amount': finalAmount,
        'method_code': methodCode,
        'method_currency': methodCurrency,
        'status': status,
        'trx': trx,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'user': user?.toJson(),
      };
}
