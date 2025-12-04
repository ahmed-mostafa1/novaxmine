import 'data.dart';

class DepositInsertResponseModel {
  String? status;
  String? message;
  Data? data;

  DepositInsertResponseModel({this.status, this.message, this.data});

  factory DepositInsertResponseModel.fromJson(Map<String, dynamic> json) {
    return DepositInsertResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
