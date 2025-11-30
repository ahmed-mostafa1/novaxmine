// To parse this JSON data, do
//
//     final generalSettingResponseModel = generalSettingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:mine_lab/data/model/auth/login/login_response_model.dart';

GeneralSettingResponseModel generalSettingResponseModelFromJson(String str) => GeneralSettingResponseModel.fromJson(json.decode(str));

String generalSettingResponseModelToJson(GeneralSettingResponseModel data) => json.encode(data.toJson());

class GeneralSettingResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  GeneralSettingResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory GeneralSettingResponseModel.fromJson(Map<String, dynamic> json) => GeneralSettingResponseModel(
        remark: json["remark"],
        status: json["status"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message": message?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  GeneralSetting? generalSetting;
  String? socialLoginRedirect;

  Data({
    this.generalSetting,
    this.socialLoginRedirect,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        generalSetting: json["general_setting"] == null ? null : GeneralSetting.fromJson(json["general_setting"]),
        socialLoginRedirect: json["social_login_redirect"],
      );

  Map<String, dynamic> toJson() => {
        "general_setting": generalSetting?.toJson(),
        "social_login_redirect": socialLoginRedirect,
      };
}

class GeneralSetting {
  String? curText;
  String? curSym;
  String? baseColor;
  String? secondaryColor;
  String? kv;
  String? ev;
  String? maintenanceMode;
  String? securePassword;
  String? agree;
  String? multiLanguage;
  String? registration;
  String? activeTemplate;
  String? paginateNumber;
  String? systemCustomized;
  String? currencyFormat;
  String? referralSystem;
  String? googleLogin;
  String? facebookLogin;
  String? linkedinLogin;

  GeneralSetting({
    this.curText,
    this.curSym,
    this.baseColor,
    this.secondaryColor,
    this.kv,
    this.ev,
    this.maintenanceMode,
    this.securePassword,
    this.agree,
    this.multiLanguage,
    this.registration,
    this.activeTemplate,
    this.paginateNumber,
    this.systemCustomized,
    this.currencyFormat,
    this.referralSystem,
    this.googleLogin,
    this.facebookLogin,
    this.linkedinLogin,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) => GeneralSetting(
        curText: json["cur_text"]?.toString(),
        curSym: json["cur_sym"]?.toString(),
        baseColor: json["base_color"]?.toString(),
        secondaryColor: json["secondary_color"]?.toString(),
        kv: json["kv"]?.toString(),
        ev: json["ev"]?.toString(),
        maintenanceMode: json["maintenance_mode"]?.toString(),
        securePassword: json["secure_password"]?.toString(),
        agree: json["agree"]?.toString(),
        multiLanguage: json["multi_language"]?.toString(),
        registration: json["registration"]?.toString(),
        activeTemplate: json["active_template"]?.toString(),
        paginateNumber: json["paginate_number"]?.toString(),
        systemCustomized: json["system_customized"]?.toString(),
        currencyFormat: json["currency_format"]?.toString(),
        referralSystem: json["referral_system"]?.toString(),
        googleLogin: json["google_login"]?.toString(),
        facebookLogin: json["facebook_login"]?.toString(),
        linkedinLogin: json["linkedin_login"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "cur_text": curText,
        "cur_sym": curSym,
        "base_color": baseColor,
        "secondary_color": secondaryColor,
        "kv": kv,
        "ev": ev,
        "maintenance_mode": maintenanceMode,
        "secure_password": securePassword,
        "agree": agree,
        "multi_language": multiLanguage,
        "registration": registration,
        "active_template": activeTemplate,
        "paginate_number": paginateNumber,
        "system_customized": systemCustomized,
        "currency_format": currencyFormat,
        "referral_system": referralSystem,
        "google_login": googleLogin,
        "facebook_login": facebookLogin,
        "linkedin_login": linkedinLogin,
      };
}
