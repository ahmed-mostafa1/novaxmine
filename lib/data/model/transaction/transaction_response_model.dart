import '../auth/registration_response_model.dart';

class TransactionResponseModel {
  final String? remark;
  final String? status;
  final Message? message;
  final Data? data;

  TransactionResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return TransactionResponseModel(
      remark: json['remark'],
      status: json['status'],
      message: json['message'] != null ? Message.fromJson(json['message']) : null,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'remark': remark,
      'status': status,
      'message': message?.toJson(),
      'data': data?.toJson(),
    };
  }
}

class Data {
  final Transactions? transactions;
  final List<Remarks>? remarks;
  final List<FilterCurrency>? currency;

  Data({
    this.transactions,
    this.remarks,
    this.currency,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      transactions: json['transactions'] != null ? Transactions.fromJson(json['transactions']) : null,
      remarks: json['remarks'] != null ? (json['remarks'] as List).map((v) => Remarks.fromJson(v)).toList() : null,
      currency: json["currencies"] == null ? [] : List<FilterCurrency>.from(json["currencies"]!.map((x) => FilterCurrency.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions?.toJson(),
      'remarks': remarks?.map((v) => v.toJson()).toList(),
    };
  }
}

class Remarks {
  final String? remark;

  Remarks({
    this.remark,
  });

  factory Remarks.fromJson(Map<String, dynamic> json) {
    return Remarks(
      remark: json['remark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'remark': remark,
    };
  }
}

class Transactions {
  final List<TransactionData>? data;

  final dynamic nextPageUrl;
  final String? path;

  Transactions({
    this.data,
    this.nextPageUrl,
    this.path,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      data: json['data'] != null ? (json['data'] as List).map((v) => TransactionData.fromJson(v)).toList() : null,
      nextPageUrl: json['next_page_url'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((v) => v.toJson()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
    };
  }
}

class TransactionData {
  final int? id;
  final String? userId;
  final String? amount;
  final String? charge;
  final String? currency;
  final String? postBalance;
  final String? trxType;
  final String? trx;
  final String? details;
  final String? remark;
  final String? createdAt;
  final String? updatedAt;

  TransactionData({
    this.id,
    this.userId,
    this.amount,
    this.charge,
    this.currency,
    this.postBalance,
    this.trxType,
    this.trx,
    this.details,
    this.remark,
    this.createdAt,
    this.updatedAt,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      id: json['id'],
      userId: json['user_id']?.toString(),
      amount: json['amount']?.toString() ?? '0',
      charge: json['charge']?.toString() ?? '0',
      currency: json['currency']?.toString(),
      postBalance: json['post_balance']?.toString() ?? '0',
      trxType: json['trx_type']?.toString() ?? '0',
      trx: json['trx'] ?? '',
      details: json['details'] ?? '',
      remark: json['remark'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'amount': amount,
      'charge': charge,
      'currency': currency,
      'post_balance': postBalance,
      'trx_type': trxType,
      'trx': trx,
      'details': details,
      'remark': remark,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class FilterCurrency {
  String? currency;

  FilterCurrency({
    this.currency,
  });

  factory FilterCurrency.fromJson(Map<String, dynamic> json) => FilterCurrency(
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
      };
}
