import 'package:mine_lab/data/model/global/meassage_model.dart';

class DepositInsertResponseModel {
  DepositInsertResponseModel({String? remark, String? status, Message? message, DepositInsertData? data}) {
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
  }

  DepositInsertResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _message = json["message"] == null ? null : Message.fromJson(json["message"]);
    _data = json['data'] != null ? DepositInsertData.fromJson(json['data']) : null;
  }

  String? _remark;
  String? _status;
  Message? _message;
  DepositInsertData? _data;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  DepositInsertData? get data => _data;
}

class DepositInsertData {
  Deposit? deposit;
  String? redirectUrl;

  DepositInsertData({
    this.deposit,
    this.redirectUrl,
  });

  factory DepositInsertData.fromJson(Map<String, dynamic> json) => DepositInsertData(
        deposit: json["deposit"] == null ? null : Deposit.fromJson(json["deposit"]),
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "deposit": deposit?.toJson(),
        "redirect_url": redirectUrl,
      };
}

class Deposit {
  String? successUrl;
  String? failedUrl;

  Deposit({
    this.successUrl,
    this.failedUrl,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        successUrl: json["success_url"],
        failedUrl: json["failed_url"],
      );

  Map<String, dynamic> toJson() => {
        "success_url": successUrl,
        "failed_url": failedUrl,
      };
}
