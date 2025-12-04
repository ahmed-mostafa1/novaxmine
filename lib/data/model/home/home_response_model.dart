import 'package:mine_lab/data/model/auth/registration_response_model.dart';
import 'package:mine_lab/data/model/user/user.dart';

class HomeResponseModel {
  final String? remark;
  final String? status;
  final Message? message;
  final Data? data;

  HomeResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
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
  final String? referralLink;
  final String? coinImagePath;
  final WidgetData? widget;
  final List<Miners>? miners;
  final List<Transactions>? transactions;
  final Plan? plan;
  final GlobalUser? user;

  Data({
    this.referralLink,
    this.coinImagePath,
    this.widget,
    this.miners,
    this.transactions,
    this.plan,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      referralLink: json['referral_link']?.toString() ?? '',
      coinImagePath: json['coin_image_path']?.toString() ?? '',
      widget:
          json['widget'] != null ? WidgetData.fromJson(json['widget']) : null,
      miners: json['miners'] != null
          ? (json['miners'] as List).map((v) => Miners.fromJson(v)).toList()
          : null,
      transactions: json['transactions'] != null
          ? (json['transactions'] as List)
              .map((v) => Transactions.fromJson(v))
              .toList()
          : null,
      plan: json['plan'] != null ? Plan.fromJson(json['plan']) : null,
      user: json['user'] != null ? GlobalUser.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'referral_link': referralLink,
      'coin_image_path': coinImagePath,
      'widget': widget?.toJson(),
      'miners': miners?.map((v) => v.toJson()).toList(),
      'transactions': transactions?.map((v) => v.toJson()).toList(),
      'plan': plan?.toJson(),
      'user': user?.toJson(),
    };
  }
}

class Plan {
  final String? pending;
  final String? approved;
  final String? rejected;
  final String? unpaid;

  Plan({
    this.pending,
    this.approved,
    this.rejected,
    this.unpaid,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      pending: json['pending']?.toString(),
      approved: json['approved']?.toString(),
      rejected: json['rejected']?.toString(),
      unpaid: json['unpaid']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pending': pending,
      'approved': approved,
      'rejected': rejected,
      'unpaid': unpaid,
    };
  }
}

class Transactions {
  final int? id;
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

  Transactions({
    this.id,
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

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'],
      amount: json['amount']?.toString() ?? '0',
      charge: json['charge']?.toString() ?? '0',
      currency: json['currency']?.toString(),
      postBalance: json['post_balance']?.toString() ?? '0',
      trxType: json['trx_type']?.toString(),
      trx: json['trx']?.toString(),
      details: json['details']?.toString() ?? '',
      remark: json['remark']?.toString(),
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
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

class Miners {
  final int? id;
  final String? name;
  final String? coinCode;
  final String? coinImage;
  final String? minWithdrawLimit;
  final String? maxWithdrawLimit;
  final UserCoinBalances? userCoinBalances;

  Miners({
    this.id,
    this.name,
    this.coinCode,
    this.coinImage,
    this.minWithdrawLimit,
    this.maxWithdrawLimit,
    this.userCoinBalances,
  });

  factory Miners.fromJson(Map<String, dynamic> json) {
    return Miners(
      id: json['id'],
      name: json['name']?.toString(),
      coinCode: json['currency_code']?.toString() ?? '',
      coinImage: json['coin_image']?.toString(),
      minWithdrawLimit: json['min_withdraw_limit']?.toString() ?? '0',
      maxWithdrawLimit: json['max_withdraw_limit']?.toString() ?? '0',
      userCoinBalances: json['user_coin_balances'] != null
          ? UserCoinBalances.fromJson(json['user_coin_balances'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currency_code': coinCode,
      'coin_image': coinImage,
      'min_withdraw_limit': minWithdrawLimit,
      'max_withdraw_limit': maxWithdrawLimit,
      'user_coin_balances': userCoinBalances?.toJson(),
    };
  }
}

class UserCoinBalances {
  final int? id;
  final String? userId;
  final String? minerId;
  final String? wallet;
  final String? balance;
  final String? createdAt;
  final String? updatedAt;

  UserCoinBalances({
    this.id,
    this.userId,
    this.minerId,
    this.wallet,
    this.balance,
    this.createdAt,
    this.updatedAt,
  });

  factory UserCoinBalances.fromJson(Map<String, dynamic> json) {
    return UserCoinBalances(
      id: json['id'],
      userId: json['user_id']?.toString(),
      minerId: json['miner_id']?.toString(),
      wallet: json['wallet']?.toString(),
      balance: json['balance']?.toString() ?? '0',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'miner_id': minerId,
      'wallet': wallet,
      'balance': balance,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class WidgetData {
  final String? depositWallet;
  final String? profitWallet;
  final String? totalReturnedAmount;
  final String? totalReferralCommission;
  final String? totalEarning;

  WidgetData({
    this.depositWallet,
    this.profitWallet,
    this.totalReturnedAmount,
    this.totalReferralCommission,
    this.totalEarning,
  });

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    return WidgetData(
      depositWallet: json['deposit_wallet']?.toString(),
      profitWallet: json['profit_wallet']?.toString(),
      totalReturnedAmount: json['total_returned_amount']?.toString(),
      totalReferralCommission: json['total_referral_commission'].toString(),
      totalEarning: json['total_earning'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deposit_wallet': depositWallet,
      'profit_wallet': profitWallet,
      'total_returned_amount': totalReturnedAmount,
      'total_referral_commission': totalReferralCommission,
      'total_earning': totalEarning,
    };
  }
}
