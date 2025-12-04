import 'package:mine_lab/data/model/global/meassage_model.dart';

class MiningTrackResponseModel {
  final String? remark;
  final String? status;
  final Message? message;
  final Data? data;

  MiningTrackResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MiningTrackResponseModel.fromJson(Map<String, dynamic> json) {
    return MiningTrackResponseModel(
      remark: json['remark'],
      status: json['status'],
      message:
          json['message'] != null ? Message.fromJson(json['message']) : null,
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
  final Orders? orders;
  final Orders? miningTracks;

  Data({
    this.orders,
    this.miningTracks,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      orders: json['orders'] != null ? Orders.fromJson(json['orders']) : null,
      miningTracks: json['mining_tracks'] != null
          ? Orders.fromJson(json['mining_tracks'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders?.toJson(),
    };
  }
}

class Orders {
  final List<MiningTrackData>? data;
  final String? nextPageUrl;
  final String? path;

  Orders({
    this.data,
    this.nextPageUrl,
    this.path,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((v) => MiningTrackData.fromJson(v))
              .toList()
          : null,
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

class MiningTrackData {
  final int? id;
  final String? trx;
  final String? userId;
  final String? minerId;
  final PlanDetails? planDetails;
  final Miner? miner;
  final String? amount;
  final String? minReturnPerDay;
  final String? maxReturnPerDay;
  final String? period;
  final String? periodRemain;
  final String? status;
  final String? maintenanceCost;
  final String? lastPaid;
  final String? createdAt;
  final String? updatedAt;
  final String? totalEarnedAmount;
  String? currencyName;
  String? currencyCode;

  MiningTrackData({
    this.id,
    this.trx,
    this.userId,
    this.minerId,
    this.planDetails,
    this.miner,
    this.amount,
    this.minReturnPerDay,
    this.maxReturnPerDay,
    this.period,
    this.periodRemain,
    this.maintenanceCost,
    this.status,
    this.lastPaid,
    this.createdAt,
    this.updatedAt,
    this.totalEarnedAmount,
    this.currencyName,
    this.currencyCode,
  });

  factory MiningTrackData.fromJson(Map<String, dynamic> json) {
    return MiningTrackData(
      id: json['id'],
      trx: json['trx']?.toString(),
      userId: json['user_id']?.toString(),
      minerId: json['miner_id']?.toString(),
      planDetails: json['plan_details'] != null
          ? PlanDetails.fromJson(json['plan_details'])
          : null,
      miner: json['miner'] != null ? Miner.fromJson(json['miner']) : null,
      amount: json['amount']?.toString(),
      minReturnPerDay: json['min_return_per_day']?.toString(),
      maxReturnPerDay: json['max_return_per_day']?.toString(),
      period: json['period']?.toString(),
      periodRemain: json['period_remain']?.toString(),
      maintenanceCost: json['maintenance_cost']?.toString(),
      status: json['status']?.toString(),
      lastPaid: json['last_paid']?.toString(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      totalEarnedAmount: json['total_earned_amount'],
      currencyName: json['currency_name'],
      currencyCode: json['currency_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trx': trx,
      'user_id': userId,
      'miner_id': minerId,
      'plan_details': planDetails?.toJson(),
      'amount': amount,
      'min_return_per_day': minReturnPerDay,
      'max_return_per_day': maxReturnPerDay,
      'period': period,
      'period_remain': periodRemain,
      'status': status,
      'last_paid': lastPaid,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class PlanDetails {
  final String? title;
  final String? miner;
  final String? speed;
  final String? period;
  final String? periodValue;
  final String? periodUnit;

  PlanDetails({
    this.title,
    this.miner,
    this.speed,
    this.period,
    this.periodValue,
    this.periodUnit,
  });

  factory PlanDetails.fromJson(Map<String, dynamic> json) {
    return PlanDetails(
      title: json['title']?.toString(),
      miner: json['miner']?.toString() ?? '',
      speed: json['speed']?.toString() ?? '',
      period: json['period']?.toString() ?? '',
      periodValue: json['period_value']?.toString() ?? '',
      periodUnit: json['period_unit']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'miner': miner,
      'speed': speed,
      'period': period,
      'period_value': periodValue,
      'period_unit': periodUnit,
    };
  }
}

class Miner {
  String? id;
  String? name;
  String? currencyCode;
  String? coinImage;
  String? rate;

  Miner({
    this.id,
    this.name,
    this.currencyCode,
    this.coinImage,
    this.rate,
  });

  factory Miner.fromJson(Map<String, dynamic> json) => Miner(
        id: json["id"].toString(),
        name: json["name"],
        currencyCode: json["currency_code"],
        coinImage: json["coin_image"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency_code": currencyCode,
        "coin_image": coinImage,
        "rate": rate,
      };
}
